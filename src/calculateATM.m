function atm = calculateATM(h)
	atm = 0.5 - (3*h - 5)^4 + (3*h - 5)^2 + h/2;
endfunction