function expValues = expValuesFunction(relativeFitnesses,T)
	aux = [];
	for i=1:length(relativeFitnesses)
		aux = [aux exp(relativeFitnesses(i)/T)];
	endfor

	avg = mean(aux);
	expValues = aux ./ avg;
endfunction