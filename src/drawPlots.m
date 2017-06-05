function drawPlots(maxFitnessIndividual, items, maxFitnesses, averageFitnesses,populationFitnesses,configuration)

	figure(1);
	drawBestIndividualItems(maxFitnessIndividual, items);
	figure(2);
	drawFitnessAndHistogram(maxFitnesses,averageFitnesses,populationFitnesses,configuration);
	refresh;
end