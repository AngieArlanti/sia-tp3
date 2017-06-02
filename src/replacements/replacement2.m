function [G newPopulation] = replacement2(population, fitnesses, children, childrenFitnesses, configuration, temperature)
  
  N = configuration.N;
  k = configuration.k

  if(length(population)!= N|| length(children)!= k)
    disp('ERROR: N != population or children != k');
      exit(1);
    end

  x = N - k;

  selection1 = selectForReplacement(population, fitnesses, configuration, temperature);
  
  newPopulation = generateCombinatedPopulation(selection1, children);

  G = k/N;

end
  

