function a = main()
  temperature = 1;
  items = {
    dlmread('../resources/armas.tsv', '\t',1, 1),
    dlmread('../resources/botas.tsv', '\t',1, 1),
    dlmread('../resources/cascos.tsv', '\t',1, 1),
    dlmread('../resources/guantes.tsv', '\t',1, 1),
    dlmread('../resources/pecheras.tsv', '\t',1, 1)
  };

  configuration = parseConfigurationFile('./configuration.txt');
  % struct de structs de vector de ids y la h (de cada item)
  population = generatePopulation(configuration.N);
  % vector de fitness para cada status
  populationFitnesses = calculateAllFitness(population, items, configuration);
  [temperature, selectedPopulation] = selectParents(population, populationFitnesses, configuration, temperature);

  % This should probably be done inside the selectParents function in some replacement methods
  children = crossover(selectedPopulation, configuration);
  a = mutation(children, configuration.pm);
end
