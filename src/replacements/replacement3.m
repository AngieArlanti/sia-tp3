function [G newPopulation] = replacement3(population, fitnesses, children, childrenFitnesses ,configuration, temp)
	
	N = configuration.N;
	k = configuration.k

	if(length(population)!= N|| length(children)!= k)
		disp('ERROR: N != population or children != k');
    	exit(1);
    endif

	x = N - k;

	selection1 = hibridSelectionSanti(population, fitnesses, configuration, x, temp);

	populationWithChildren = generateCombinatedPopulation(population, childen);

	populationWithChildrenFitnesess = [fitnesses childrenFitnesses];

	selection2 = hibridSelectionSanti(populationWithChildren, populationWithChildrenFitnesess, configuration, k, temp);
	
	newPopulation = generateCombinatedPopulation(selection1, selection2);

	

endfunction