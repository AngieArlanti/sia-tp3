function dem = calculateDEM(h)
	dem = 2 + (3*h - 5)^4 - (3*h - 5)^2 - h/2;
endfunction