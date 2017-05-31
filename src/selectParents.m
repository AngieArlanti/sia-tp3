function [temperature, selected] = selectParents(population, relativeFitnesses, configuration, temperature)
  permutation = randperm(length(population));
  shuffledPopulation = population(permutation);
  shuffledFitnesses = relativeFitnesses(permutation);
  
  if (configuration.selectionBlend != 0)
    method1Amount = length(population) * configuration.selectionBlend;
    method1Population = shuffledPopulation(1:method1Amount);
    method1Fitnesses = relativeFitnesses(1:method1Amount) / configuration.selectionBlend;
    method1k = configuration.k * configuration.selectionBlend;
    disp(cstrcat('selecting ', mat2str(method1k), ' with ', configuration.selectionMethod1));
    method1Selection = selectWithMethod(configuration.selectionMethod1,
                                        method1Population,
                                        method1Fitnesses,
                                        method1k,
                                        configuration.temperature,
                                        temperature);
  end

  if (configuration.selectionBlend != 1)
    method2Population = shuffledPopulation(method1Amount + 1:length(population));
    method2Fitnesses = relativeFitnesses(method1Amount + 1:length(relativeFitnesses))/(1 - configuration.selectionBlend);
    method2k = configuration.k * (1 - configuration.selectionBlend);
    disp(cstrcat('selecting ', mat2str(method2k), ' with ', configuration.selectionMethod2));
    method2Selection = selectWithMethod(configuration.selectionMethod2,
                                        method2Population,
                                        method2Fitnesses,
                                        method2k,
                                        configuration.temperature,
                                        temperature);
  end
  selected = [method1Selection method2Selection];
end

function selection = selectWithMethod(selectionMethod, population, fitnesses, k, temperatureConstant, temperature)
  source('selections/rouletteSelection.m');
  source('selections/rankingSelection.m');
  source('selections/eliteSelection.m');
  source('selections/universalSelection.m');
  source('selections/boltzmannSelection.m');
  source('selections/deterministicTournamentSelection.m');
  source('selections/probabilisticTournamentSelection.m');

  switch selectionMethod
  case 'roulette'
    selection = rouletteSelection(population, fitnesses, k);
  case 'elite'
    selection = eliteSelection(population, fitnesses, k);
  case 'universal'
    selection = universalSelection(population, fitnesses, k);
  case 'boltzmann'
    [selection, temperature] = boltzmannSelection(population, fitnesses, temperature, temperatureConstant, k)
  case {'ranking', 'deterministicTournament', 'probabilisticTournament'}
    disp(strcat(selectionMethod, ' selection not implemented'));
  otherwise
    disp('ERROR: Invalid selection method');
    exit(1);
  end
end
