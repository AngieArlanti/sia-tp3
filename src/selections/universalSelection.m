function selection = universalSelection(population, fitnesses, k)
%universalSelection - Selects future parents using universal selection
%
% Syntax: selection = universalSelection(population, fitnesses, k)
%
  relativeFitnesses = calculateRelativeFitnesses(fitnesses);
  rj =[];
  r = rand();
  for j=1:k
    aux=(r+j-1)/k;
    rj = [rj aux];
  end
  selection = rouletteSelection(population, relativeFitnesses, k, rj);
end
