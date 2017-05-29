function children = uniformCrossover(parent1, parent2, configuration)
%uniformCrossover - Performs uniform crossover between genes of @parent1 and @parent2
%
% Syntax: children = uniformCrossover(parent1, parent2, configuration)
%

  resultGenes1 = [];
  resultGenes2 = [];
  genes1 = [parent1{1} parent1{2}];
  genes2 = [parent2{1} parent2{2}];
  for i = 1 : length(genes1)
    if rand() > 0.5
      resultGenes1 = [resultGenes1 genes1(i)];
      resultGenes2 = [resultGenes2 genes2(i)];
    else
      resultGenes1 = [resultGenes1 genes2(i)];
      resultGenes2 = [resultGenes2 genes1(i)];
    end
  end
  children = {
    {
      resultGenes1(1:5),
      resultGenes1(6)
    },
    {
      resultGenes2(1:5),
      resultGenes2(6)
    }
  };
end
