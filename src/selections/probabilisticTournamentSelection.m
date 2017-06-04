%probabilisticTournamentSelection - Selects future parents using probabilisticTournament selection
function selection = probabilisticTournamentSelection(population, relativeFitnesses, configuration)
  % Repeat deterministic tournament selection k times
   for i = 1:configuration.k
     % Choose 2 individuals randomly
     randomIndexes = randperm(length(population));
     randomIndividuals = {};
     randomIndividualsFitnesses = [];
    for j = 1:2
      randomIndividuals{j} = {population{randomIndexes(j)}};
      randomIndividualsFitnesses(j)=relativeFitnesses(randomIndexes(j));
    end
    randomIndividuals
    randomIndividualsFitnesses
    randi = rand
    if(randi < 0.75)
      % Choose best fitness
      selection{i} = eliteSelection(randomIndividuals,randomIndividualsFitnesses,1);
    else
      % Choose worst fitness
      selection{i} = worstSelection(randomIndividuals,randomIndividualsFitnesses,1);
    end
    selection
  end
end

function selection = worstSelection(population, fitnesses, k)
  relativeFitnesses = calculateRelativeFitnesses(fitnesses);
  selection = {};
  [s, i] = sort(relativeFitnesses,'ascend');
  indexes = i(1:k);

  for i = 1:k
    selection{i} = population{indexes(i)};
  end
end
