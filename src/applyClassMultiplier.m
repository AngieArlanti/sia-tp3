function stats = applyClassMultiplier(sumStats, className)
  classMultipliers = getClassMultiplier(className);
  stats = classMultipliers .* sumStats;
end

function multipliers = getClassMultiplier(className)
  switch(className)
    case 'assasin2'
      multipliers = [0.9, 1.0, 1.1, 1.0, 0.9];
    otherwise
      multipliers = [1, 1, 1, 1, 1];
  end
end
