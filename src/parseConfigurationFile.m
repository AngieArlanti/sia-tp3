%  Prevent Octave from thinking that this
%  is a function file:
% 1;
% Return a config object with all the data from the configuration file
function config = parseConfigurationFile(configurationFilePath)
  fid = fopen (configurationFilePath, 'r');
  config.alpha = 0;
  while (!feof (fid))
    line = fgetl (fid);
    if length(line) == 0 || line(1) == '%'
      continue;
    end

    split = strsplit(line, '=');
    key = split{1};
    value = split{2};
    switch key
      case 'k'
        config.k = str2num(value);
      case 'N'
        config.N = str2num(value);
      case 'm'
        config.m = str2num(value);
      case 'pm'
        config.pm = str2double(value);
      case 'pc'
        config.pc = str2double(value);
      case 'G'
        config.G = str2double(value);
      case 'className'
        config.className = value;
      case 'temperature'
        config.temperature = str2double(value);
      case 'fitnessConst1'
        config.fitnessConst1 = str2double(value);
      case 'fitnessConst2'
        config.fitnessConst2 = str2double(value);
      case 'selectionBlend'
        config.selectionBlend = str2double(value);
      case 'selectionMethod1'
        config.selectionMethod1 = value;
      case 'selectionMethod2'
        config.selectionMethod2 = value;
      case 'selectionBlend2'
       config.selectionBlend2 = str2double(value);
      case 'selectionMethod3'
        config.selectionMethod3 = value;
      case 'selectionMethod4'
        config.selectionMethod4 = value;
      case 'replacementMethod'
        config.replacementMethod = value;
      case 'crossoverMethod'
        config.crossoverMethod = value;
      case 'cutCondition'
        config.cutCondition = value;
      case 'maxGenerations'
        config.maxGenerations = str2num(value);
      case 'debug'
        config.debug = value;
    end
  end
  fclose(fid);
end
