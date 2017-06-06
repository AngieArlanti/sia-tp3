%probabilisticTournamentSelection - Selects future parents using probabilisticTournament selection
function selection = probabilisticTournamentSelection(population, fitnesses, k)
  selection = {};
  % Repeat deterministic tournament selection k times
  for i = 1:k
    % Choose 2 individuals randomly
    randomIndexes = randperm(length(population));
    randomIndividuals = {};
    randomIndividualsFitnesses = [];
    
    randomIndividuals = population(randomIndexes)(1:2);
    randomIndividualsFitnesses = fitnesses(randomIndexes)(1:2);

    randi = rand;
    if(randi < 0.75)
      % Choose best fitness
      selection{i} = eliteSelection(randomIndividuals, randomIndividualsFitnesses, 1){1};
    else
      % Choose worst fitness
      selection{i} = worstSelection(randomIndividuals, randomIndividualsFitnesses, 1){1};
    end
  end
end

function selection = worstSelection(population, fitnesses, k)
  selection = {};
  [s, indexes] = sort(fitnesses,'ascend');

  for i = 1:k
    selection{i} = population{indexes(i)};
  end

end
