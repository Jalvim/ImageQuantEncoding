function image = quantVecDecoder(message)
  
  dim = message(1:2)';
  m = message(3);
  message = message(4:end);
  idx = find(isnan(message));
  codeBook = readCodeBook(m, message(1:idx), false);
  
  for ii = 1:length(codeBook)
    len = length(codeBook{ii}); 
    if len ~= m^2
      codeBook{ii} = [codeBook{ii}; zeros((m^2-len), 1)];
    end 
  end 
  
  message = message((idx+1):end);
  image = readImage(codeBook, message, m, dim); 

end