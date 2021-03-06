function children = crossover(population, configuration)
  children = {};
  for i = 1:length(population)/2 % FIXME: I believe this should always return length(population) children
    currentChildren = singleCrossover(population{2*i - 1}, population{2*i}, configuration);
    children{2*i - 1} = currentChildren{1};
    children{2*i} = currentChildren{2};
  end
  randperm(length(population));
end

function children = singleCrossover(parent1, parent2, configuration)
  switch configuration.crossoverMethod
    case 'uniform'
      children = uniformCrossover(parent1, parent2, configuration);
    case 'anular'
      children = anularCrossover(parent1, parent2, configuration);
    case 'twoPoints'
      children = twoPointsCrossover(parent1, parent2, configuration);
    case 'onePoint' 
      children = onePointCrossover(parent1, parent2, configuration);
    otherwise
      disp('ERROR: invalid crossover method');
      exit(1);
  end
end
