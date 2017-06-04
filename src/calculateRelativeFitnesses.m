function relativeFitnesses = calculateRelativeFitnesses(fitnesses)

  summatory = sum(fitnesses);
  relativeFitnesses = [];
  
  for i=1:length(fitnesses)
    relativeFitnesses = [relativeFitnesses fitnesses(i)/summatory];
  endfor

endfunction
