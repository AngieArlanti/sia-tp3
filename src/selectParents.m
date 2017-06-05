function [temperature, selected] = selectParents(mode, population, fitnesses, configuration, temperature, k = configuration.k)
  
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
      
    method1k = ceil(k * blend);
    if configuration.debug == 't'
      disp(cstrcat(mode, ' ', mat2str(method1k), ' with ', method1));
    end
    method1Selection = selectWithMethod(method1,
                                        population,
                                        fitnesses,
                                        method1k,
                                        configuration.temperature,
                                        temperature);
  else
    method1Selection = {};
  end

  if (blend != 1)

    method2k = floor(k * (1 - blend));
    if configuration.debug == 't'
      disp(cstrcat(mode, ' ', mat2str(method2k), ' with ', method2));
    end
    method2Selection = selectWithMethod(method2,
                                        population,
                                        fitnesses,
                                        method2k,
                                        configuration.temperature,
                                        temperature);
  else
    method2Selection = {};
  end
  
  selectedAux = [method1Selection method2Selection];
  
  if strcmp(mode, 'selection')  
    permutation = randperm(length(selectedAux));
    selected = selectedAux(permutation);
  else
    selected = selectedAux;
  end
  
end

function selection = selectWithMethod(selectionMethod, population, fitnesses, k, temperatureConstant, temperature)
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
