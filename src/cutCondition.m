function [type boolean] = cutCondition(population, populationFitnesses, generation, configuration, maxFitnesses, previousPopulation)
%cutCondition - Description
%
% Syntax: boolean = cutCondition(population, populationFitnesses, generation, configuration)
%
  type = configuration.cutCondition;
  content=0;
  structure=0;

  switch configuration.cutCondition
  case 'maxGenerations'
    boolean = maxGenerations(generation, configuration);
  case 'bestSolution'
    boolean = isBestSolution(maxFitnesses,configuration);
  case 'structure'
    boolean = !structureHasChanged(population, previousPopulation ,configuration);
  case 'content'
  	boolean = !contentHasChanged(maxFitnesses,configuration);
  case 'mixed'
    if(!contentHasChanged(maxFitnesses,configuration))
        content=1;
        type = 'content';
    endif
    if(!structureHasChanged(population, previousPopulation ,configuration))
      structure=1;
      type = 'structure';
    endif
    boolean = (content || structure);
  endswitch
end
