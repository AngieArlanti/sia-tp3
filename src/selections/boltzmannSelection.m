function [selection, T] = boltzmannSelection(population,
                                             fitnesses,
                                             generationTemperature,
                                             temperatureConstant,
                                             k)
%boltzmannSelection - Selects future parents using boltzmann selection
%
% Syntax: selection = boltzmannSelection(population, relativeFitnesses, configuration)
% Param: first generationTemperature must be 1. Then we must iterate through generations.
% returns: parents selected for this generation and this generation temperature.
  T = temperatureFunction(temperatureConstant, generationTemperature);
  expValues = expValuesFunction(fitnesses, T);
  expRelativeValues = calculateRelativeFitnesses(expValues);

  selection = universalSelection(population, expRelativeValues, k);
end
