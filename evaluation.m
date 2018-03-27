function [scores, oldscores] = evaluation(context, popg, cities, scalingFunction, c)
    scores = zeros(context.S, 1); 
    
    for i=1:context.S
        x = popg(i,:);
        scores(i) = context.fitnessFunction(x, cities);
    end
    
    % Keep track of scores values before modifications
    oldscores = scores;

    if isequal(context.problemFunction, @min)
        scores=minimisation(scores);
    end
    
    % SCALING
    scores = scalingFunction(scores, c);
end