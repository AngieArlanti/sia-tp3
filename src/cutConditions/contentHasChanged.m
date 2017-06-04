function boolean = contentHasChanged(maxFitnesses,configuration)
%Test
%function boolean = contentHasChanged(maxFitnesses,contentPreviousIndexToCompare)
  if(length(maxFitnesses) - contentPreviousIndexToCompare > 0)
    boolean = maxFitnesses(end) != maxFitnesses(configuration.contentPreviousIndexToCompare);
    %Test
    %boolean = maxFitnesses(end) != maxFitnesses(end-contentPreviousIndexToCompare);
  else
    boolean = 1;
  end
end