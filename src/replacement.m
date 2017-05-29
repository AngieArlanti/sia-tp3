function replacement(population, children, configuration)
  source('replacements/r1Replacement.m');
  source('replacements/r2Replacement.m');
  source('replacements/r3Replacement.m');

  rMethod = replacementMethod(configuration)
  switch rMethod
    case { 'r1', 'r2', 'r3' }
      disp(strcat(rMethod, ' replacement not implemented');
    otherwise
      disp('ERROR: Replacement method not valid');
      exit(1);
    end
  end
end

function replacementMethod = replacementMethod(configuration)
  if rand() < configuration.replacementBlend
    replacementMethod = configuration.replacementMethod1;
  else
    replacementMethod = configuration.replacementMethod2;
  end
end
