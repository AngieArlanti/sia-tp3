#rankingSelection - Selects future parents using ranking selection
function selection = rankingSelection(population, fitnesses, k)
	
	rankingFitnesses = sort(fitnesses);
	probRanking = [];
	lenRankingFitnesses = length(rankingFitnesses);
	acumuladoAux = cumsum(1:lenRankingFitnesses);
	acumulado = acumuladoAux(lenRankingFitnesses);
	sumProb = 0;
	for i = 1 : lenRankingFitnesses
		 sumProb += i/(acumulado);
		probRanking = [probRanking sumProb];
	end
	sumProb
	selection = rouletteSelection(population, probRanking, k);
end