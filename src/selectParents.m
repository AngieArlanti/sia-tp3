function [temperature, selected] = selectParents(mode, population, fitnesses, configuration, temperature, k = configuration.k)
  permutation = randperm(length(population));
  shuffledPopulation = population(permutation);
  shuffledFitnesses = fitnesses(permutation);
  
  if mode == 'selection'
    blend = configuration.selectionBlend;
    method1 = configuration.selectionMethod1;
    method2 = configuration.selectionMethod2;
  elseif mode == 'replacement'
    blend = configuration.replacementBlend;
    method1 = configuration.replacementMethod1;
    method2 = configuration.replacementMethod2;
  end
    
  if (blend != 0)
    method1Amount = length(population) * blend;
    method1Population = shuffledPopulation(1:method1Amount);
    method1Fitnesses = fitnesses(1:method1Amount) / blend;
    method1k = k * blend;
    disp(cstrcat(mode, ' ', mat2str(method1k), ' with ', method1));
    method1Selection = selectWithMethod(method1,
                                        method1Population,
                                        method1Fitnesses,
                                        method1k,
                                        configuration.temperature,
                                        temperature);
  end

  if (blend != 1)
    method2Population = shuffledPopulation(method1Amount + 1:length(population));
    method2Fitnesses = fitnesses(method1Amount + 1:length(fitnesses))/(1 - blend);
    method2k = k * (1 - blend);
    disp(cstrcat(mode, ' ', mat2str(method2k), ' with ', configuration.selectionMethod2));
    method2Selection = selectWithMethod(method2,
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
    [selection, temperature] = boltzmannSelection(population, fitnesses, temperature, temperatureConstant, k);
  case {'ranking', 'deterministicTournament', 'probabilisticTournament'}
    disp(strcat(selectionMethod, ' selection not implemented'));
  otherwise
    disp('ERROR: Invalid selection method');
    exit(1);
  end
end
