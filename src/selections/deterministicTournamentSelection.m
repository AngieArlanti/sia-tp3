%deterministicTournamentSelection - Selects future parents using deterministicTournament selection
function selection = deterministicTournamentSelection(population, fitnesses, k, m)
  %function selection = deterministicTournamentSelection(population={{[1,2,3,4,6],'x1'} {[7,8,3,4,6],'x2'} {[8,7,30,4,6],'x3'} {[1,2,3,4,6],'x4'} {[1,2,3,4,6],'x5'}}, relativeFitness=[0.086, 0.171, 0.314, 0.400, 0.029], parseConfigurationFile('./configuration.txt'))
  % Repeat deterministic tournament selection k times
   for i = 1:k
    % Choose m individuals randomly
    randomIndexes = randperm(length(population));
    pop = population(randomIndexes)(1:m);
    fit = fitnesses(randomIndexes)(1:m);
    selection{i} = eliteSelection(pop, fit, 1){1};
  end
end
