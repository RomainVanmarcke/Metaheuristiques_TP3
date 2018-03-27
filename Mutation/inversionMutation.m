function child = inversionMutation( child )
%INVERSIONMUTATION Summary of this function goes here
%   Detailed explanation goes here
    L = length(child);
    idxToInsert = randi([1, L]);
    n = randi([1, L-idxToInsert+1]);
    locusToInsert = fliplr(child(idxToInsert:idxToInsert+n-1));
    idxDestination = randi([1, L]);
    
    while (idxToInsert <= idxDestination) && (idxDestination < idxToInsert + n)
        disp("idxDestination WHILE : " + idxDestination);
        idxDestination = randi([1, L]);
    end
    
    disp("idxToInsert : " + idxToInsert);
    disp("numToInsert : " + n);
    disp("idxDestination : " + idxDestination);
    
    if idxToInsert < idxDestination
        child(idxToInsert : idxDestination-n) = child(idxToInsert+n:idxDestination);
        child(idxDestination-n+1:idxDestination) = locusToInsert;
    elseif idxToInsert > idxDestination   
        child(idxDestination+n : idxToInsert+n-1) = child(idxDestination : idxToInsert-1);
        child(idxDestination:idxDestination+n-1) = locusToInsert;
    else
        child(idxDestination:idxDestination+n-1) = locusToInsert;
    end
    

end

