% TODO

function children = onePointCrossover(parent1, parent2, configuration)
%onePointCrossover - Performs one point crossover between genes of @parent1 and @parent2
%
% Syntax: children = onePointCrossover(parent1, parent2, configuration)
%
% Long description
	len = length(parent1{1}) + length(parent1{2});

	r = ceil(rand(1,1)*len);
	parent1Genes = individualToGenes(parent1);
	parent2Genes = individualToGenes(parent2);

	parent1GenesMod = [parent1Genes(1:r-1) parent2Genes(r:len)];
	parent2GenesMod = [parent2Genes(1:r-1) parent1Genes(r:len)];

	children = {genesToIndividual(parent1GenesMod) genesToIndividual(parent2GenesMod)};
end
