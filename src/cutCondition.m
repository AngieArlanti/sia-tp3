function boolean = cutCondition(population, populationFitnesses, generation, configuration, maxFitnesses, previousPopulation)
%cutCondition - Description
%
% Syntax: boolean = cutCondition(population, populationFitnesses, generation, configuration)
%

  switch configuration.cutCondition
  case 'maxGenerations'
    boolean = maxGenerations(generation, configuration);
  case 'bestSolution'
    %boolean =
  case 'structureHasChanged'
    boolean = !structureHasChanged();
  case 'content'
  	boolean = !contentHasChanged(maxFitnesses,configuration);
  end
end
