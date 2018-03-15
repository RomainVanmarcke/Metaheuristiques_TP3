function context = setContext(fitnessFunction, N, Gmax)
    context = [];
    context.N = N;
    context.Gmax = Gmax;
    context.fitnessFunction = fitnessFunction;

    switch(func2str(context.fitnessFunction))
        case "distanceFitness"
            context.lower = [-1000];
            context.upper = [1000];
            context.L = 2;
    end
end

