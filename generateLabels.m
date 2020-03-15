function labels = generateLabels(startDate, Nlabels)
label = arrayfun(@(i) startDate + i*7, 0:Nlabels, 'UniformOutput',false);
labels = cellfun(@(z) string(z.Day)+"/"+string(z.Month) ...
  ,label,'UniformOutput',false);