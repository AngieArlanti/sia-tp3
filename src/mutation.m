function children = mutation(children, pm)
	for i = 1 : length(children)
		genes = individualToGenes(children{i});
		r = rand(1, length(genes));
		genesToMutate = find(r < pm);
		if length(genesToMutate) > 0
			disp(cstrcat("individual ", mat2str(i), " mutated"));
		end
		for j = 1 : length(genesToMutate)
			if j < 6
				genes(genesToMutate(j)) = ceil(rand(1,1)*1000000);
			elseif
				genes(genesToMutate(j)) = rand(1,1)*0.7 + 1.3;
			end
		endfor
		children{i} = genesToIndividual(genes);
	endfor
endfunction