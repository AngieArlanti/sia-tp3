function [temperature, selected] = selectForReplacement(population, fitnesses, configuration, temperature, k = configuration.k)
%selectForReplacement - Selects from @population with methods 1 and 2
%
% Syntax: [temperature, selected] = selectForReplacement(population, fitnesses, configuration, temperature)
%
  [temperature, selected] = selectParents('replacement', population, fitnesses, configuration, temperature);
end
