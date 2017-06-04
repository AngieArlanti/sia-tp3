function [temperature newPopulation] = replacement3(population, fitnesses, children, childrenFitnesses, configuration, temp)
  N = configuration.N;
  k = configuration.k;

  if (length(population) != N || length(children) != k)
    disp('ERROR: N != population or children != k');
    if configuration.debug == 't'
      disp(cstrcat('N:', mat2str(N)));
      disp(cstrcat('length(population)', mat2str(length(population))));
      disp(cstrcat('children: ', mat2str(length(children))));
      disp(cstrcat('k:', mat2str(k)));
    end
  end

  x = N - k;

  [temperature selection1] = selectForReplacement(population, fitnesses, configuration, temp, x);

  populationWithChildren = generateCombinatedPopulation(population, children);
  populationWithChildrenFitnesess = [fitnesses childrenFitnesses];
  
  [temperature selection2] = selectForReplacement(populationWithChildren, populationWithChildrenFitnesess, configuration, temp, k);

  newPopulation = generateCombinatedPopulation(selection1, selection2);
end
