function drawPlots(maxFitnessIndividual, items, maxFitnesses, averageFitnesses,populationFitnesses,configuration,outputFileName)

	f1 = figure(1);
	drawBestIndividualItems(maxFitnessIndividual, items);
	f2 = figure(2);
	drawFitnessAndHistogram(maxFitnesses,averageFitnesses,populationFitnesses,configuration);
	if(configuration.test == 'f')
		refresh;	
	else
		fpath = ['../tests/' outputFileName '/'];
		saveas(f1, fullfile(fpath, ['BestIndividualItems - ' outputFileName]), 'png');
		saveas(f2, fullfile(fpath, ['FitnessAndHistogram - ' outputFileName]), 'png');
	end
end