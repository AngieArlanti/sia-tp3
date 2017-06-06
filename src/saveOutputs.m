function filePath = saveOutputs(finalSeconds, maxFitness, generations,configuration,items, maxFitnessIndividual,cutType, outputFileName)

  mkdir ('../', 'tests');
  mkdir ('../tests/', outputFileName);

  filePath = ['../tests/' outputFileName '/' outputFileName '.txt'];
  idArma = maxFitnessIndividual{1}(1);
  idBota = maxFitnessIndividual{1}(2);
  idCasco = maxFitnessIndividual{1}(3);
  idGuante = maxFitnessIndividual{1}(4);
  idPechera = maxFitnessIndividual{1}(5);

  fid = fopen (filePath, "w");
  fdisp (fid, ctime(time()));
  fdisp (fid, "");
  fdisp (fid, "===============================================");
  fdisp (fid, "CONFIGURATION ");
  fdisp (fid, "");
  fdisp (fid, configuration);
  fdisp (fid, "");
  fdisp (fid, "===============================================");
  fdisp (fid, "OUTPUTS");
  fdisp (fid, "");
  fdisp (fid, "Time (min): ");
  fdisp (fid, finalSeconds/60);
  fdisp (fid, "");
  fdisp (fid, "Cut Condition: ");
  fdisp (fid, cutType);
  fdisp (fid, "");
  fdisp (fid, "Generations: ");
  fdisp (fid, generations);
  fdisp (fid, "");
  fdisp (fid, "MaxFitness: ");
  fdisp (fid, maxFitness);
  fdisp (fid, "");
  fdisp (fid, "Fu     Ag    Ex    Re    Vi");
  fdisp (fid, "===============================================");
  fdisp (fid, "Id Arma: ");
  fdisp (fid, idArma);
  fdisp (fid, "");
  fdisp (fid, "Arma: ");
  fdisp (fid, items{1}(idArma,:));
  fdisp (fid, "");
  fdisp (fid, "Id Bota: ");
  fdisp (fid, idBota);
  fdisp (fid, "");
  fdisp (fid, "Bota: ");
  fdisp (fid, items{2}(idBota,:));
  fdisp (fid, "");
  fdisp (fid, "Id Casco: ");
  fdisp (fid, idCasco);
  fdisp (fid, "");
  fdisp (fid, "Casco: ");
  fdisp (fid, items{3}(idCasco,:));
  fdisp (fid, "");
  fdisp (fid, "Id Guante: ");
  fdisp (fid, idGuante);
  fdisp (fid, "");
  fdisp (fid, "Guante: ");
  fdisp (fid, items{4}(idGuante,:));
  fdisp (fid, "");
  fdisp (fid, "Id Pechera: ");
  fdisp (fid, idPechera);
  fdisp (fid, "");
  fdisp (fid, "Pechera: ");
  fdisp (fid, items{5}(idPechera,:));
  fdisp (fid, "");
  fdisp (fid, "Hight Individual: ");
  fdisp (fid, maxFitnessIndividual{2});
  fdisp (fid, "");
  
  fclose (fid);

end