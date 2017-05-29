function sumStats = getSumStats(individual, allItems)
	sumStats = zeros(1, 5);
	for i = 1 : length(individual{1})
		sumStats += allItems{i}(individual{1}(i), :);
	endfor
endfunction