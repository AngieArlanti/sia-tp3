function [selection, T] = boltzmannSelection(population, relativeFitnesses,generationTemperature, configuration)
%boltzmannSelection - Selects future parents using boltzmann selection
%
% Syntax: selection = boltzmannSelection(population, relativeFitnesses, configuration)
% Param: first generationTemperature must be 1. Then we must iterate through generations.
% returns: parents selected for this generation and this generation temperature.
  
  T = temperatureFunction(configuration.temperature,generationTemperature);
  expValues = expValuesFunction(relativeFitnesses,T);
  expRelativeValues = calculateRelativeFitnesses(expValues);


  selection = universalSelection(population, expRelativeValues, configuration);

end