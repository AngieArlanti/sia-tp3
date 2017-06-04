function result = drawStats(stats, maximum = max(stats))
  pkg load geometry;
  angles = (0:4)*2*pi/5;
  labels = {'Fuerza', 'Agilidad', 'Pericia', 'Resistencia', 'Vida'};
  for i = 1:5
    xpos = sin(angles(i)) * maximum * 1.05;
    ypos = cos(angles(i)) * maximum * 1.05;
    text(xpos, ypos, labels{i});
  end
  text(0, maximum * 1.5, strcat('Precio relativo: ', mat2str(ceil(100 * sum(stats)/(maximum * 5)))));
  points = [stats .* sin(angles); stats .* cos(angles)]';
  maximums = maximum * ones(1, 5);
  pentagon = [maximums .* sin(angles); maximums .* cos(angles)]';
  drawPolygon(pentagon);
  result = drawPolygon(points);
  xlim([-maximum, maximum]);
  ylim([-maximum, maximum]);
end
