function cities = initialization(problem)
    % init cities
    cities = zeros(problem.N, problem.L);
    for n = 1:N
        for l = 1:L
            x = problem.lower(l) + (problem.upper(l) - problem.lower(l))*rand;
            cities(n,l) = x;
        end
    end
end

