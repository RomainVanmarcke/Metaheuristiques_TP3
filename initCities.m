function cities = initCities(N, L)
%INITCITIES Summary of this function goes here
    % init cities
    lower = [0, 0];
    upper = [10 10];
    cities = zeros(N, L);
    for n = 1:N
        for l = 1:L
            x = lower(l) + (upper(l) - lower(l))*rand;
            cities(n,l) = x;
        end
    end
end

