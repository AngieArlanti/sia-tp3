function children = mutation(children, pm)
  for i = 1 : length(children)
    genes = individualToGenes(children{i});
    r = rand(1, length(genes));
    genesToMutate = find(r < pm);
    for j = 1 : length(genesToMutate)
      if genesToMutate(j) < 6
        genes(genesToMutate(j)) = ceil(rand(1,1)*1000000);
      else
        genes(genesToMutate(j)) = rand()*0.7 + 1.3;
      end
    end
    children{i} = genesToIndividual(genes);
  end
end
