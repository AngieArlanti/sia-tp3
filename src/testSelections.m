function selection = testSelections()
  configuration = parseConfigurationFile("./configuration.txt");

  population={{[1,2,3,4,6],'x1'} {[7,8,3,4,6],'x2'} {[8,7,30,4,6],'x3'} {[1,2,3,4,6],'x4'} {[1,2,3,4,6],'x5'}};
  relativeFitness=[0.086, 0.171, 0.314, 0.400, 0.029];

  #[selection, T] =boltzmannSelection(population, relativeFitness, 1,configuration);
  #selection = universalSelection(population, relativeFitness, configuration);
  #selection = eliteSelection(population, relativeFitness, configuration);
  #selection = rouletteSelection(population, relativeFitness, configuration);
  #selection = deterministicTournamentSelection(population, relativeFitness, configuration);
  selection = probabilisticTournamentSelection(population, relativeFitness, configuration);

endfunction
