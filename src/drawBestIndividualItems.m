function figure = drawBestIndividualItems(maxFitnessIndividual, items)
  newplot;
  bestItems = maxFitnessIndividual{1};
  names = {'Arma', 'Botas', 'Casco', 'Guantes', 'Pechera'};
  maximumValues = [48, 9, 27, 9, 37];
  for i = 1:5
    subplot(1, 5, i);
    newplot;
    axis('square');
    title(names{i});
    drawStats(items{i}(bestItems(i), :), maximumValues(i));
  end
  refresh;
end
