function boolean = cutCondition(population, populationFitnesses, generation, configuration, maxFitnesses)
%cutCondition - Description
%
% Syntax: boolean = cutCondition(population, populationFitnesses, generation, configuration)
%

  switch configuration.cutCondition
  case 'maxGenerations'
    boolean = maxGenerations(generation, configuration);
  case 'bestSolution'
    %boolean =
  case 'structure'
    %boolean =
  case 'content'
  	boolean = !contentHasChanged(maxFitnesses,configuration);
  end
end
