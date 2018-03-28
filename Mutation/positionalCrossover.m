function children = positionalCrossover(firstParent, secondParent, locusNb)
%POSITIONALLCROSSOVER 

L = length(firstParent);
r = randsample(L, locusNb);
r2 = randsample(L,locusNb);

firstChild = zeros(size(firstParent));
secondChild = zeros(size(firstParent));

for i=1:locusNb
    firstChild(r(i))=firstParent(r(i));
    secondChild(r2(i)) = secondParent(r2(i));
end

[~, firstIndices] = setdiff(secondParent, firstChild);
[~, secondIndices] = setdiff(firstParent, secondChild);

firstIndices = sort(firstIndices);
secondIndices = sort(secondIndices);

firstCounter =1;
secondCounter =1;

for i=1:length(firstIndices)
    while firstChild(firstCounter)~=0
        firstCounter = firstCounter +1;
    end
    firstChild(firstCounter) = secondParent(firstIndices(i));
    
    while secondChild(secondCounter)~=0
        secondCounter = secondCounter +1;
    end
    secondChild(secondCounter) = firstParent(secondIndices(i));
end

children = [firstChild ; secondChild];

end
