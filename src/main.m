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
    % vector de fitness para cada status

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
    figure(1);
    drawBestIndividualItems(maxFitnessIndividual, items);
    figure(2);
    newplot;
    subplot(1, 2 ,1);
    plot(maxFitnesses, 'r');
    hold on;
    plot(averageFitnesses, 'b');
    legend('Fitness máximo', 'Fitness promedio');
    xlabel('generaciones');
    ylabel('fitness');
    xlim([1, 100]);
    ylim([0, 40]);
    subplot(1, 2 ,2);
    hist(populationFitnesses);
    xlabel('fitness');
    ylabel('cantidad de individuos');
    refresh;
    ++generation;
  end
end
