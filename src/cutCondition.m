function boolean = cutCondition(population, populationFitnesses, generation, configuration)
%cutCondition - Description
%
% Syntax: boolean = cutCondition(population, populationFitnesses, generation, configuration)
%
  switch configuration.cutCondition
  case 'maxGenerations'
    boolean = maxGenerations(generation, configuration);
  end
end
