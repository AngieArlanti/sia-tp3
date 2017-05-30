function selection = eliteSelection(population, relativeFitness,configuration)
	
	k=configuration.k;
	selection = {};
	
	[s, i] = sort(relativeFitness,'descend');
	indexes = i(1:k);

	for i=1:k	
		selection{i} = population{indexes(i)};
	endfor
endfunction