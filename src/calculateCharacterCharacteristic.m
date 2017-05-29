function characteristic = calculateCharacterCharacteristic(consts, stats)
	characteristic = consts .* tanh(0.01 .* stats);
endfunction