function boolean = cutCondition(population, populationFitnesses, generation, configuration)
%cutCondition - Description
%
% Syntax: boolean = cutCondition(population, populationFitnesses, generation, configuration)
%

  source('cutConditions/maxGenerations.m');
  switch configuration.cutCondition
  case 'maxGenerations'
    boolean = maxGenerations(generation, configuration);
  end
end
