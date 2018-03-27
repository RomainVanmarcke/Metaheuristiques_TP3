function main()
    %% CONFIGURATION PART 
    % Comment/Uncomment to choose your parameters

    %GENERAL SETTINGS
    N = 10; %Number of cities
    S = 20; %Number of possibilities in one generation
    
    Gmax = 50; %Generation max
    pc = 0.8; %Crossover probability
    pm = 0.01; %Mutation probability
    lambda = 10; %Number of children
    M = lambda+mod(lambda, 2); %MatingPool size
    
    %FITNESS
    fitnessFunction = @distanceFitness;
       
    %SCALING
    scalingFunction = @nop;
%     scalingFunction = @linearScaling;
%     scalingFunction = @sigmaScaling; %need c
    c = 2; %Control parameter : integer between [1,5]
    
    %RANKING
    rankingFunction = @nop;
%      rankingFunction = @firstLinearRanking;
%    rankingFunction = @secondLinearRanking;
%     rankingFunction = @nonLinearRanking;
    alphaRanking = 1.7;
    r=2/N^2;
    nonLinearAlpha = 0.9;

    %SELECTION
%     selectionFunction = @rws;
%      selectionFunction = @stochasticUniversalSampling;
    selectionFunction = @tournamentSelection; %need k
    k = 2; %size of tournament
    
    %CROSSOVER
    crossoverFunction = @partialCrossover;
    
    %MUTATION
    mutationFunction = @insertionMutation;
    
    context = setContext(fitnessFunction, N, S, Gmax);
    
    %REPLACEMENT
    tournament = false; % False for kill worst, True for kill tournament
    
    %FEASIBILITY
    feasibilityFunction = @TSPMethod;
    
    %STOPPING CONDITIONS
    threshold = 0; %stop the execution if abs(fitnessMeanGi+1 - fitnessMeanGi) < threshold
    optimalValue = 0; %stop the execution when this value is reached 

    %% EXECUTION PART
    scores = zeros(Gmax, S); %scores is a matrix of scores
    oldscores = zeros(Gmax, S); %same as scores, used to keep track of scores before fitness modifications
    pop = zeros(Gmax, S, N); %pop is a matrix of chromosomes
    
    % INITIALIZATION
    [cities, pop(1,:,:)] = initialization(context); 

    
    % Process all generations
    for g=1:Gmax 
    	popg = reshape(pop(g,:, :), [S, N]);    
        % EVALUATION
        [scores(g,:), oldscores(g,:)] = evaluation(context, popg, cities); 
        % RANKING
        rankedScores = ranking(rankingFunction,scores(g,:), alphaRanking, r, nonLinearAlpha);
        % SELECTION
        matingPool= selection(selectionFunction, rankedScores, M, popg, k); %matingPool is a vector of chromosomes
        % CROSSOVER
        children = crossover(crossoverFunction, matingPool, pc, N); %children is a vector of chromosomes
        % MUTATION
        mutatedChildren = mutation(mutationFunction, children, pm);
        % REPLACEMENT
        pop(g+1,:,:) = replacement(pop(g,:,:), scores(g,:), lambda, k, tournament, mutatedChildren);
        % TEST FEASIBILITY
        pop(g+1,:,:) = testFeasibility(reshape(pop(g+1,:, :), [S, N])); 
    end
end
    

