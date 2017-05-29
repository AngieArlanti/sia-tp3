function selection = universalSelection(population,relativeFitness, k)
#function selection = universalSelection()
	rj =[];
	r = rand();
	for j=1:k
		aux=(r+j-1)/k;
		rj = [rj aux];
	endfor

	selection = rouletteSelection(population,relativeFitness,k,r);			
	#selection = rouletteSelection(population={{[1,2,3,4,6],'x1'} {[7,8,3,4,6],'x2'} {[8,7,30,4,6],'x3'} {[1,2,3,4,6],'x4'} {[1,2,3,4,6],'x5'}}, relativeFitness=[0.086, 0.171, 0.314, 0.400, 0.029], k=3,rj)
endfunction 