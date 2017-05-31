function populationFitnesses = calculateAllFitness(population, items, configuration)
  populationFitnesses = [];
  for i = 1 : length(population)
    fitness = calculateFitness(population{i}, items, configuration);
    populationFitnesses = [populationFitnesses fitness];
  end
  populationFitnesses;
end
