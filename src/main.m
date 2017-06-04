function [generation population maxFitnessIndividual] = main(items = readItems, configuration = parseConfigurationFile('./configuration.txt'))
  addpath(genpath('.'));
  temperature = 1;
  maxFitnesses = [];
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
    maxFitnesses = [maxFitnesses maxFitness];
    maxFitnessIndividual = population{maxFitnessIndex};
    figure(1);
    drawBestIndividualItems(maxFitnessIndividual, items);
    figure(2);
    newplot;
    plot(maxFitnesses);
    xlim([1, 50]);
    ylim([0, 40]);
    refresh;
    ++generation;
  end
end
