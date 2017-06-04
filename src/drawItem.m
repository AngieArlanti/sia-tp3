function result = drawItem(stats)
  angles = (0:4)*2*pi/5;
  labels = {'Fuerza', 'Agilidad', 'Pericia', 'Resistencia', 'Vida'};
  for i = 1:5
    xpos = sin(angles(i)) * (stats(i) + 0.4);
    ypos = cos(angles(i)) * (stats(i) + 0.4);
    text(xpos, ypos, labels{i});
  end
  points = [stats .* sin(angles); stats .* cos(angles)]';
  result = drawPolygon(points);
  xlim([-25, 25]);
  ylim([-25, 25]);
end
