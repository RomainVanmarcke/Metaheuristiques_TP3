function children = cycleCrossover(firstParent, secondParent, ~)
%CYCLECROSSOVER Summary of this function goes here
%   Detailed explanation goes here
    L = length(firstParent);
    firstChild = zeros(1, L);
    secondChild = zeros(1, L);
%     assert(all(firstParent), "firstParent should not contain 0");
%     assert(all(secondParent), "secondParent should not contain 0");

    elem1 = firstParent(1);
    elem2 = secondParent(1);
    firstElemCycle = elem1;
    c = 1;
    
    while ~all(firstChild)
        % assign parents elem to children
        idx = firstParent == elem1;
        if (mod(c,2) == 0)
            firstChild(idx) = elem2;
            secondChild(idx) = elem1;
        else
            firstChild(idx) = elem1;
            secondChild(idx) = elem2;
        end
        
        if (~all(firstChild))
            if (elem1 == elem2 || firstElemCycle == elem2)
                c = c + 1;
                elements1 = firstParent(firstChild == 0);
                elements2 = secondParent(secondChild == 0);
                elem1 = elements1(1);
                elem2 = elements2(1);
                firstElemCycle = elem1;
            else
                elem1 = elem2;
                elem2 = secondParent(firstParent == elem1);
            end
        end
    end
    
    children = [firstChild ; secondChild];
end

