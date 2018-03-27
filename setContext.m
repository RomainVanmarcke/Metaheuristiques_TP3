function context = setContext(fitnessFunction, N, S, Gmax)
    context = [];
    context.N = N;
    context.S = S;
    context.Gmax = Gmax;
    context.fitnessFunction = fitnessFunction;
    context.problemFunction = @min;

    switch(func2str(context.fitnessFunction))
        case "distanceFitness"
            context.lower = [0, 0];
            context.upper = [10 10];
            context.L = 2; % Number of coordinates for one city
    end
end

