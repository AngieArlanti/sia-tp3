function newPopulation = replacement(population, fitnesses, children, childrenFitnesses, configuration, temperature)
  source('replacements/replacement2.m');
  source('replacements/replacement3.m');

  rMethod = replacementMethod(configuration)
  switch rMethod
    case 'r2'
      newPopulation = replacement2(population, fitnesses, children, childrenFitnesses, configuration, temperature);
    case 'r3'
      newPopulation = replacement3(population, fitnesses, children, childrenFitnesses, configuration, temperature);
    otherwise
      disp('ERROR: Replacement method not valid');
      exit(1);
    end
end

function replacementMethod = replacementMethod(configuration)
  if rand() < configuration.replacementBlend
    replacementMethod = configuration.replacementMethod2;
  else
    replacementMethod = configuration.replacementMethod3;
  end
end
