function child = shiftingMutation(child)

    r = randsample(length(child),2);

    lowerBound = min(r);
    upperBound = max(r);

    shifting = child(lowerBound:upperBound);
    child(lowerBound:upperBound)=[];

    if length(child)==0
        child =shifting;
    else    
        p = randsample(length(child),1);
        child = [child(1:p-1), shifting, child(p:length(child))];
    end


end
   