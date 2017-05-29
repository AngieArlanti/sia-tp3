function selection = universalSelection(population, relativeFitnesses, configuration)
%universalSelection - Selects future parents using universal selection
%
% Syntax: selection = universalSelection(population, relativeFitnesses, configuration)
%
  rj =[];
  r = rand();
  for j=1:k
    aux=(r+j-1)/k;
    rj = [rj aux];
  end

  selection = rouletteSelection(population, relativeFitnesses, configuration.k, rj);
end
