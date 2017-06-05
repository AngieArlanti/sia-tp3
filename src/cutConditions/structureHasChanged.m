%Returns true if the old population matches with new population in a percentage lower than structureMaxMatchPercentage
function boolean = structureHasChanged(population, previousPopulation ,configuration)
%Test
%function boolean = structureHasChanged(population, previousPopulation ,structureMaxMatchPercentage)
  maxAmountOfEqualsIndividuals = ceil(length(previousPopulation)*configuration.structureMaxMatchPercentage);
  %Test
  %maxAmountOfEqualsIndividuals = ceil(length(population)*structureMaxMatchPercentage);
  equalIndividuals = 0;
  for i=1:length(previousPopulation)
    equalIndividuals += population(i) == previousPopulation(i);
	if(equalIndividuals == maxAmountOfEqualsIndividuals)
      break;
	end
  end

  if(equalIndividuals >= maxAmountOfEqualsIndividuals)
    boolean = 0;
  else
    boolean = 1;
  end
end