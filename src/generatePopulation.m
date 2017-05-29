function population = generatePopulation(N)
	population = {};

	for i=1:N
		items = randi([0 999999], 1, 5);
		height =  1.3 + (2-1.3) * rand(1); #Intervalo de altura: [1.3m - 2.0m]
		population{i} = {items, height};
	end
end
