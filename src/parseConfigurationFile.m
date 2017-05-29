# Prevent Octave from thinking that this
# is a function file:
#1;
#Return a config object with all the data from the configuration file
function config = parseConfigurationFile(configurationFilePath)
	fid = fopen (configurationFilePath, 'r');
	config.alpha = 0;
	while (!feof (fid))
  	line = fgetl (fid);
    disp(line);
    if length(line) == 0 || line(1) == '%'
      continue;
    endif

  	split = strsplit(line, '=');
  	key = split{1};
  	value = split{2};
  	switch key
  		case 'k'
  			config.k = str2num(value);
  		case 'N'
        config.N = str2num(value);
			case 'pm'
	      config.pm = str2double(value);
  		case 'pc'
  			config.pc = str2double(value);
  		case 'G'
  			config.G = str2double(value);
      case 'className'
        config.className = value;
      case 'temperatura'
        config.temperatura = str2double(value);
      case 'fitnessConst1'
        config.fitnessConst1 = str2double(value);
      case 'fitnessConst2'
        config.fitnessConst2 = str2double(value);
  	endswitch
	endwhile
  fclose (fid);
  printf('\n');
endfunction