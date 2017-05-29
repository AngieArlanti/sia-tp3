function selected = selectParents(population, relativeFitnesses, configuration)
  source('selections/rouletteSelection.m');
  source('selections/rankingSelection.m');
  source('selections/eliteSelection.m');
  source('selections/universalSelection.m');
  source('selections/boltzmannSelection.m');
  source('selections/deterministicTournamentSelection.m');
  source('selections/probabilisticTournamentSelection.m');

  chosenSelectionMethod = selectionMethod(configuration);
  switch chosenSelectionMethod
  case 'roulette'
    selected = rouletteSelection(population, relativeFitnesses, configuration);
  case {'elite', 'ranking', 'deterministicTournament', 'boltzmann', 'universal'}
    disp(strcat(chosenSelectionMethod, ' selection not implemented'));
  otherwise
    disp('ERROR: Invalid selection method');
    exit(1);
  end
end

function selectedMethod = selectionMethod(configuration)
  if rand() < configuration.selectionBlend
    selectedMethod = configuration.selectionMethod1;
  else
    selectedMethod = configuration.selectionMethod2;
  end
end
