function [G newPopulation] = replacement2(population, fitnesses, children ,configuration, temp)
	
	N = configuration.N;
	k = configuration.k

	if(length(population)!= N|| length(children)!= k)
		disp('ERROR: N != population or children != k');
    	exit(1);
    endif

	x = N - k;

	selection1 = hibridSelectionSanti(population, fitnesses, configuration, x, temp);
	
	newPopulation = generateCombinatedPopulation(selection1, children);

	G = k/N;

endfunction
  

