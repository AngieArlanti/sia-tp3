function [generation population maxFitnessIndividual] = main()
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
  populationFitnesses = calculateAllFitness(population, items, configuration);
  generation = 1;
  while !cutCondition(population, populationFitnesses, generation, configuration)
    % vector de fitness para cada status

    [temperature selectedPopulation] = selectForCrossover(population, populationFitnesses, configuration, temperature);

    % This should probably be done inside the selectParents function in some replacement methods
    children = crossover(selectedPopulation, configuration);
    mutatedChildren = mutation(children, configuration.pm);
    childrenFitnesses = calculateAllFitness(mutatedChildren, items, configuration);
    [temperature population] = replacement(population, populationFitnesses, mutatedChildren, childrenFitnesses, configuration, temperature);
    populationFitnesses = calculateAllFitness(population, items, configuration);
    [maxFitness maxFitnessIndex] = max(populationFitnesses);
    maxFitness
    maxFitnessIndividual = population{maxFitnessIndex};
    ++generation
  end
end
