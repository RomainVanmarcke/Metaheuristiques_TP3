function popg = testFeasibility(popg)
    % This function assures that no chromosome has a composant that does not respect the requirement
    % after a variation operation
    [S, N] = size(popg);
    for i=1:S
        A = length(unique(popg(i,:)));
        assert(A == N);
    end
end