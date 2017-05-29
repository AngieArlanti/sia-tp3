function selection = rouletteSelection(population, relativeFitness, k)
	#population = {{[1,2,3,4,6],'x1'} {[7,8,3,4,6],'x2'} {[8,7,30,4,6],'x3'} {[1,2,3,4,6],'x4'} {[1,2,3,4,6],'x5'}};
	#k=3;
	#relativeFitness = [0.086, 0.171, 0.314, 0.400, 0.029];
	q = cumsum(relativeFitness);
	r = rand(1,k)
	selection={};
	s=1;
	for j=1:length(r)
		for i=2:length(q)
			if(q(i-1) < r(j) && r(j) < q(i))
				selection{s} = population(i);
				s++;
			endif
		endfor
	endfor
endfunction