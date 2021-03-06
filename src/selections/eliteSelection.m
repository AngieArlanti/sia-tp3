function selection = eliteSelection(population, fitnesses, k)
#function selection = eliteSelection(population={{[1,2,3,4,6],'x1'} {[7,8,3,4,6],'x2'} {[8,7,30,4,6],'x3'} {[1,2,3,4,6],'x4'} {[1,2,3,4,6],'x5'}}, relativeFitness=[0.086, 0.171, 0.314, 0.400, 0.029], k=3)
  relativeFitnesses = calculateRelativeFitnesses(fitnesses);
  selection = {};

  [s, indexes] = sort(relativeFitnesses, 'descend');

  for index = 1:k
    selection{index} = population{indexes(index)};
  end
end
