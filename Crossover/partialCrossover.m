function children = partialCrossover( firstParent, secondParent)
%PARTIALCROSSOVER 
%   Detailed explanation goes here

    L = length(firstParent);
    firstChild = firstParent;
    secondChild = secondParent;
    
    % Select randomly two points
    firstPoint = randi([1, L-1]);
    secondPoint = randi([1, L-1]);

    % firstPoint should be smaller than secondPoint
    if (firstPoint > secondPoint)
        tempPoint = firstPoint;
        firstPoint = secondPoint;
        secondPoint = tempPoint;
    end
    
    firstParentPart = firstParent(firstPoint:secondPoint);
    secondParentPart = secondParent(firstPoint:secondPoint);
    
    %Crossover
    firstChild(firstPoint:secondPoint) = secondParentPart;
    secondChild(firstPoint:secondPoint) = firstParentPart;
    
    %Fix permutation
    firstChild = fixPermutation(firstChild, L, firstParentPart, secondParentPart, firstPoint, secondPoint);
    secondChild = fixPermutation(secondChild, L, secondParentPart, firstParentPart, firstPoint, secondPoint);
    
    children = [firstChild ; secondChild];

end

function child = fixPermutation(child, L, ParentPart, otherParentPart, firstPoint, secondPoint)
    round = 1;
    while(length(unique(child)) ~= L)
        for i=1:L
            if (i < firstPoint || i > secondPoint)
                for m=1:length(otherParentPart)
                    if (child(i) == otherParentPart(m)) 
                        child(i) = ParentPart(m);
                    end
                end
            end
        end
        round = round + 1;
        assert(round < 100, 'While loop took too long');
    end
end
