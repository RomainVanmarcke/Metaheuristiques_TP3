function child = insertionMutation(child)
%INSERTIONMUTATION Summary of this function goes here
%   Detailed explanation goes here
    L = length(child);
    idxToInsert = randi([1, L]);
    locusToInsert = child(idxToInsert);
    idxDestination = randi([1, L]);
    
    if idxToInsert < idxDestination
        for i=idxToInsert:idxDestination-1
            child(i) = child(i+1);
        end
        child(idxDestination) = locusToInsert;
    elseif idxToInsert > idxDestination
        for i=idxToInsert:-1:idxDestination+1
            child(i) = child(i-1);
        end
        child(idxDestination) = locusToInsert;
    end
end

