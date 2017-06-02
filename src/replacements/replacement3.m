function newPopulation = replacement3(population, fitnesses, children, childrenFitnesses, configuration, temp)
  
  N = configuration.N;
  k = configuration.k

  if(length(population)!= N|| length(children)!= k)
    disp('ERROR: N != population or children != k');
      exit(1);
    end

  x = N - k;

  selection1 = selectForReplacement(population, fitnesses, configuration, temp, x);

  populationWithChildren = generateCombinatedPopulation(population, childen);

  populationWithChildrenFitnesess = [fitnesses childrenFitnesses];

  selection2 = selectForReplacement(populationWithChildren, populationWithChildrenFitnesess, configuration, temp, k);
  
  newPopulation = generateCombinatedPopulation(selection1, selection2);
end
