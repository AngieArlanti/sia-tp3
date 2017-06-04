function attack = calculateAttack(stats, atm)
  strength = stats(1);
  agility = stats(2);
  expertise = stats(3);
  attack = (agility + expertise) * strength * atm;
end
