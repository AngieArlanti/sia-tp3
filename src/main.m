function a = main()

	items = {
		dlmread('../resources/armas.tsv', '\t',1, 1),
		dlmread('../resources/botas.tsv', '\t',1, 1),
		dlmread('../resources/cascos.tsv', '\t',1, 1),
		dlmread('../resources/guantes.tsv', '\t',1, 1),
		dlmread('../resources/pecheras.tsv', '\t',1, 1)
	};

	configuration = parseConfigurationFile('./configuration.txt');
	population = generatePopulation(configuration.N); #estructura de estuct de vector de ids y la h (de cada item)

	a = populationFitnesses = calculateAllFitness(population, items, configuration); # vector de fitness para cada status
	
	# selectedPopulation = selectPopulation(selectionType);
endfunction