function codeBook = readCodeBook(m, message, cimap)

  codeBook = {};
  
  if ~cimap
    lim = m^2;
  else
    lim = m;
  end
  
  dim = length(message) - 1;
  v = 1:lim:dim;
  len = length(v);
  
  for ii = 1:len
    
    codeBook(ii) = message(v(ii):(v(ii)+lim-1));
  
  end
  
  codeBook = codeBook;

end