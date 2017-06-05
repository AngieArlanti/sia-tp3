function result = drawFitnessAndHistogram(maxFitnesses,averageFitnesses,populationFitnesses,configuration)
  newplot;
  subplot(1, 2 ,1);
  plot(maxFitnesses, 'r');
  hold on;
  plot(averageFitnesses, 'b');
  legend({'Fitness máximo', 'Fitness promedio'}, 'location', 'southeast');
  xlabel('generaciones');
  ylabel('fitness');
  if(strcmp(configuration.cutCondition,'maxGenerations'))
    xlim([1, configuration.maxGenerations]);
  else if length(maxFitnesses) > 1
    xlim([1, length(maxFitnesses)]);
  end
  ylim([0, 60]);
  hold on;
  plot(xlim, [max(maxFitnesses), max(maxFitnesses)], 'color', [0.25, 0.25, 0.25], 'linestyle', '--');
  hold off;

  subplot(1, 2 ,2);
  hist(populationFitnesses);
  xlabel('fitness');
  ylabel('cantidad de individuos');
end
