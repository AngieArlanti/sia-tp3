function [generation maxFitness maxFitnessIndividual] = main(items = readItems, configuration = parseConfigurationFile('./configuration.txt'))
  addpath(genpath('.'));
  clf;
  temperature = 1;
  maxFitnesses = [];
  averageFitnesses = [];
  % struct de structs de vector de ids y la h (de cada item)
  previousPopulation = {};
  population = generatePopulation(configuration.N);
  populationFitnesses = calculateAllFitness(population, items, configuration);
  generation = 1;
  while !cutCondition(population, populationFitnesses, generation, configuration,maxFitnesses,previousPopulation)
    % Fitness vector for each status

    [temperature selectedPopulation] = selectForCrossover(population, populationFitnesses, configuration, temperature);

    % This should probably be done inside the selectParents function in some replacement methods
    children = crossover(selectedPopulation, configuration);
    mutatedChildren = mutation(children, configuration.pm);
    childrenFitnesses = calculateAllFitness(mutatedChildren, items, configuration);
    previousPopulation = population;
    [temperature population] = replacement(population, populationFitnesses, mutatedChildren, childrenFitnesses, configuration, temperature);
    populationFitnesses = calculateAllFitness(population, items, configuration);
    [maxFitness maxFitnessIndex] = max(populationFitnesses);
    maxFitnesses = [maxFitnesses maxFitness];
    maxFitnessIndividual = population{maxFitnessIndex};
    averageFitnesses = [averageFitnesses sum(populationFitnesses)/length(populationFitnesses)];
    
    %Plots
    figure(1);
    drawBestIndividualItems(maxFitnessIndividual, items);
    figure(2);
    drawFitnessAndHistogram(maxFitnesses,averageFitnesses,populationFitnesses,configuration);
    refresh;
    ++generation;
  end
end
