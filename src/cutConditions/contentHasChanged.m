function boolean = contentHasChanged(maxFitnesses,configuration)
%Test
%function boolean = contentHasChanged(maxFitnesses,contentPreviousIndexToCompare)
 %if(length(maxFitnesses) - configuration.contentPreviousIndexToCompare > 0)
  if(length(maxFitnesses) - configuration.contentPreviousIndexToCompare > 0)
    boolean = maxFitnesses(end) != maxFitnesses(end-configuration.contentPreviousIndexToCompare);
    %Test
    %boolean = maxFitnesses(end) != maxFitnesses(end-contentPreviousIndexToCompare);
  else
    boolean = 1;
  end
end