function image = cimapDecoder(message)

  dim = message(1:2)';
  message = message(4:end);
  idx = find(isnan(message));
  codeBook = readCodeBook(3, message(1:idx), true);
  message = message((idx+1):end);
  image = colorDeblocker(codeBook, message, dim);

end