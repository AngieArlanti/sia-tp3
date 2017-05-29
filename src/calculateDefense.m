function attack = calculateDefense(stats, dem)
	expertise = stats(3);
	resistance = stats(4);
	life = stats(5);
	attack = (resistance + expertise) * life * dem;
end
