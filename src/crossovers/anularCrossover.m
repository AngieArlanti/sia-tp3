% TODO

function children = anularCrossover(parent1, parent2, configuration)
%anularCrossover - Performs anular crossover between genes of @parent1 and @parent2
%
% Syntax: children = anularCrossover(parent1, parent2, configuration)
%
  genes1 = [parent1{1} parent1{2}];
  genes2 = [parent2{1} parent2{2}];
  chromosomeLength = 6;
  
  locus = ceil(rand * chromosomeLength);
  L = ceil(rand * chromosomeLength / 2);
  if locus + L > chromosomeLength
    resultGenes1 = [genes2(1: locus + L - chromosomeLength) genes1(locus + L - chromosomeLength + 1:locus) genes2(locus:chromosomeLength)];
    resultGenes2 = [genes1(1: locus + L - chromosomeLength) genes2(locus + L - chromosomeLength + 1:locus) genes1(locus:chromosomeLength)];
  else
    resultGenes1 = [genes2(1:locus) genes1(locus + 1:locus+L) genes2(locus + L + 1:chromosomeLength)];
    resultGenes2 = [genes1(1:locus) genes2(locus + 1:locus+L) genes1(locus + L + 1:chromosomeLength)];
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
