function combination = generateCombinatedPopulation(struct1, struct2)
  combination = struct1;
  j = 1;
  for i = length(struct1) + 1:length(struct1) + length(struct2)
    combination{i} = struct2{j};
    j++;
  end
end
