function matingPool = selection(selectionFunction, scoresg, M, popg, k)
    N = size(popg, 2);
    matingPool = zeros(M, N);
    indices = selectionFunction(scoresg, M, k);
    for i=1:M
          matingPool(i, :) = popg(indices(i), :);
    end
end
