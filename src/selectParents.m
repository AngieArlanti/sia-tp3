function [temperature, selected] = selectParents(mode, population, fitnesses, configuration, temperature, k = configuration.k)
  permutation = randperm(length(population));
  shuffledPopulation = population(permutation);
  shuffledFitnesses = fitnesses(permutation);
  
  if strcmp(mode, 'selection')
    blend = configuration.selectionBlend;
    method1 = configuration.selectionMethod1;
    method2 = configuration.selectionMethod2;
  elseif strcmp(mode, 'replacement')
    blend = configuration.selectionBlend2;
    method1 = configuration.selectionMethod3;
    method2 = configuration.selectionMethod4;
  end

  if (blend != 0)
    method1Amount = round(length(population) * blend);
    if strcmp(configuration.hybridWithPartitions, 't')
      method1Population = shuffledPopulation(1:method1Amount);
      method1Fitnesses = shuffledFitnesses(1:method1Amount) / blend;
    else
      method1Population = shuffledPopulation;
      method1Fitnesses = shuffledFitnesses;
    end

    method1k = round(k * blend);
    if configuration.debug == 't'
      disp(cstrcat(mode, ' ', mat2str(method1k), ' with ', method1));
    end
    method1Selection = selectWithMethod(method1,
                                        method1Population,
                                        method1Fitnesses,
                                        method1k,
                                        configuration.temperature,
                                        temperature);
  else
    method1Amount = 0;
    method1Selection = {};
  end

  if (blend != 1)
    if strcmp(configuration.hybridWithPartitions, 't')
      method2Population = shuffledPopulation(method1Amount + 1:length(population));
      method2Fitnesses = shuffledFitnesses(method1Amount + 1:length(fitnesses))/(1 - blend);
    else
      method2Population = shuffledPopulation;
      method2Fitnesses = shuffledFitnesses;
    end

    method2k = round(k * (1 - blend));
    if configuration.debug == 't'
      disp(cstrcat(mode, ' ', mat2str(method2k), ' with ', method2));
    end
    method2Selection = selectWithMethod(method2,
                                        method2Population,
                                        method2Fitnesses,
                                        method2k,
                                        configuration.temperature,
                                        temperature);
  else
    method2Selection = {};
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
