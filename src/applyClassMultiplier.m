function stats = applyClassMultiplier(sumStats, className)
  classMultipliers = getClassMultiplier(className);
  stats = classMultipliers .* sumStats;
end

function multipliers = getClassMultiplier(className)
  switch(className)
    case 'assasin1'
      multipliers = [0.8, 1.2, 1.1, 1.0, 0.8];
    case 'assasin2'
      multipliers = [0.9, 1.0, 1.1, 1.0, 0.9];
    case 'assasin3'
      multipliers = [0.9, 0.9, 1.0, 1.1, 1.0];
    case 'defensor1'
      multipliers = [1, 0.9, 0.7, 1.2, 1.1];
    case 'defensor2'
      multipliers = [1.1, 0.8, 0.8, 1.1, 1.1];
    case 'warrior1'
      multipliers = [1.1, 0.9, 0.8, 1.0, 0.9];
    case 'warrior2'
      multipliers = [1.2, 1.0, 0.8, 0.8, 0.8];
    case 'warrior3'
      multipliers = [0.8, 0.9, 0.9, 1.2, 1.1];
    case 'archer1'
      multipliers = [0.8, 1.1, 1.1, 0.9, 0.7];
    case 'archer2'
      multipliers = [0.9, 1.1, 1.0, 0.9, 0.8];
    case 'archer3'
      multipliers = [0.8, 0.8, 0.8, 1.1, 1.2];
    otherwise
      multipliers = [1, 1, 1, 1, 1];
  end
end
