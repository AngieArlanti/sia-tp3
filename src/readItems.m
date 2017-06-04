function items = readItems()
  items = {
    dlmread('../resources/armas.tsv', '\t', 1, 1),
    dlmread('../resources/botas.tsv', '\t', 1, 1),
    dlmread('../resources/cascos.tsv', '\t', 1, 1),
    dlmread('../resources/guantes.tsv', '\t', 1, 1),
    dlmread('../resources/pecheras.tsv', '\t', 1, 1)
  };
end
