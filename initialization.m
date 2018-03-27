function [cities, pop1] = initialization(context)
    % init cities
    cities = zeros(context.N, context.L);
    for n = 1:context.N
        for l = 1:context.L
            x = context.lower(l) + (context.upper(l) - context.lower(l))*rand;
            cities(n,l) = x;
        end
    end
    
    % init first generation of sequences
    pop1 = zeros(context.S, context.N);
    for m=1:context.S
       pop1(m,:) = randperm(context.N); 
    end
end

