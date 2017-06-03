function [temperature newPopulation] = replacement(population, fitnesses, children, childrenFitnesses, configuration, temperature)
  source('replacements/replacement2.m');
  source('replacements/replacement3.m');

  rMethod = configuration.replacementMethod;
  switch rMethod
    case 'r2'
      [temperature newPopulation] = replacement2(population, fitnesses, children, childrenFitnesses, configuration, temperature);
    case 'r3'
      [temperature newPopulation] = replacement3(population, fitnesses, children, childrenFitnesses, configuration, temperature);
    otherwise
      disp('ERROR: Replacement method not valid');
      exit(1);
    end
end
