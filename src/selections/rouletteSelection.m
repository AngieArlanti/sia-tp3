function selection = rouletteSelection(population,
                                      fitnesses,
                                      k,
                                      r = rand(1, k))
  relativeFitnesses = calculateRelativeFitnesses(fitnesses);
  q = cumsum(relativeFitnesses);
  selection={};
  s=1;
  for j = 1:length(r)
    for i = 2:length(q)
      if(q(i-1) < r(j) && r(j) < q(i))
        selection{s} = population{i};
        s++;
      end
    end
  end
  if ((s-k) != 1)
    disp('ERROR: Roulette generated less values than expected');
  end
end
