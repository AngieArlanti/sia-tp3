function boolean = isBestSolution(maxFitnesses,configuration)
  boolean = maxFitnesses(end) >= configuration.bestSolutionFitness;
end