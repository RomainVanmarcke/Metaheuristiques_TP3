function pop1 = initialization(context) 
    % init first generation of sequences
    pop1 = zeros(context.S, context.N);
    for m=1:context.S
       pop1(m,:) = randperm(context.N); 
    end
end

