function children = crossover(population, configuration)
  source('crossovers/uniformCrossover.m');
  source('crossovers/onePointCrossover.m');
  source('crossovers/twoPointsCrossover.m');
  source('crossovers/anularCrossover.m');

  children = {};
  for i = 1:length(population)/2 % FIXME: I believe this should always return length(population) children
    currentChildren = singleCrossover(population{2*i - 1}, population{2*i}, configuration);
    children{2*i - 1} = currentChildren{1};
    children{2*i} = currentChildren{2};
  end
  randperm(length(population));
end

function child = singleCrossover(parent1, parent2, configuration)
  switch configuration.crossoverMethod
    case 'uniform'
      child = uniformCrossover(parent1, parent2, configuration);
    case { 'onePoint', 'twoPoints', 'anular' }
      disp(strcat(configuration.crossoverMethod, ' crossover not implemented'));
    otherwise
      disp('ERROR: invalid crossover method');
      exit(1);
  end
end
