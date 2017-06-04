function figure = drawBestIndividualItems(maxFitnessIndividual, items)
  newplot;
  bestItems = maxFitnessIndividual{1};
  names = {'armas', 'botas', 'cascos', 'guantes', 'pecheras'};
  for i = 1:5
    subplot(1, 5, i);
    newplot;
    axis('square');
    title(names{i});
    drawItem(items{i}(bestItems(i), :));
  end
  refresh;
end
