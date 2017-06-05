function boolean = cutCondition(population, populationFitnesses, generation, configuration, maxFitnesses, previousPopulation)
%cutCondition - Description
%
% Syntax: boolean = cutCondition(population, populationFitnesses, generation, configuration)
%

  switch configuration.cutCondition
  case 'maxGenerations'
    boolean = maxGenerations(generation, configuration);
  case 'bestSolution'
    boolean = isBestSolution(maxFitnesses,configuration);
  case 'structure'
    boolean = !structureHasChanged(population, previousPopulation ,configuration);
  case 'content'
  	boolean = !contentHasChanged(maxFitnesses,configuration);
  end
end
