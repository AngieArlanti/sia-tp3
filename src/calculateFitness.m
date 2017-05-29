function fitness = calculateFitness(individual, items, configuration)
	stats = applyClassMultiplier(getSumStats(individual, items), configuration.className);
	consts = [100, 1, 0.6, 1, 100];
	characteristics = calculateCharacterCharacteristic(consts, stats);
	attack = calculateAttack(characteristics, calculateATM(individual{2}));
	defense = calculateDefense(characteristics, calculateDEM(individual{2}));
	fitness = configuration.fitnessConst1 * attack + configuration.fitnessConst2 * defense;
end
