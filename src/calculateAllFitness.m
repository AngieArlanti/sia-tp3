function relativePopulationFitnesses = calculateAllFitness(population, items, configuration)
  populationFitnesses = [];
  totalFitness = 0;
  for i = 1 : length(population)
    fitness = calculateFitness(population{i}, items, configuration);
    populationFitnesses = [populationFitnesses fitness];
    totalFitness += fitness;
  end
  relativePopulationFitnesses = populationFitnesses ./ totalFitness;
end
