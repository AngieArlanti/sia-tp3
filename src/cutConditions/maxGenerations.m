function boolean = maxGenerations(generation, configuration)
%maxGenerations - Description
%
% Syntax: boolean = maxGenerations(generation)
%
  boolean = generation > configuration.maxGenerations;
end
