% TODO

function children = twoPointsCrossover(parent1, parent2, configuration)
%twoPointsCrossover - Performs one point crossover between genes of @parent1 and @parent2
%
% Syntax: children = twoPointsCrossover(parent1, parent2, configuration)
%
% Long description
  genes1 = [parent1{1} parent1{2}];
  genes2 = [parent2{1} parent2{2}];
  chromosomeLength = 6;
  
  locus1 = ceil(rand * (chromosomeLength - 1)); % -1 because it can't be the last one
  locus2 = ceil(rand * (chromosomeLength - locus1)) + locus1; % has to be between locus1 and chromosomeLength
  
  resultGenes1 = [genes1(locus1:locus2) genes2(1:locus1) genes2(locus2:chromosomeLength)];
  resultGenes2 = [genes2(locus1:locus2) genes1(1:locus1) genes1(locus2:chromosomeLength)];

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
