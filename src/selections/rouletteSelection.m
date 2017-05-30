function selection = rouletteSelection(population, relativeFitness, configuration, r = rand(1,configuration.k))
	q = cumsum(relativeFitness);
	selection={};
	s=1;
	for j=1:length(r)
		for i=2:length(q)
			if(q(i-1) < r(j) && r(j) < q(i))
				selection{s} = population(i);
				s++;
			end
		end
	end
end
