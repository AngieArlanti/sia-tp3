function characteristic = calculateCharacterCharacteristic(stats, consts = [100, 1, 0.6, 1, 100])
  characteristic = consts .* tanh(0.01 .* stats);
end
