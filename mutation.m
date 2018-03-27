function children = mutation(mutationFunction, children, pm)
	for i=1:size(children,1)
        if rand<=pm
            children(i,:) = mutationFunction(children(i,:));
        end
	end
end