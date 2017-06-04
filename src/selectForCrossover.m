function [temperature, selected] = selectForCrossover(population, fitnesses, configuration, temperature)
%selectForCrossover - Selects from @population with methods 1 and 2
%
% Syntax: [temperature, selected] = selectForCrossover(population, fitnesses, configuration, temperature)
%
  [temperature, selected] = selectParents('selection', population, fitnesses, configuration, temperature);
end
