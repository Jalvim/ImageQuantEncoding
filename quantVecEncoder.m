function [message, D] = quantVecEncoder(input, l, n)

  D_ant = 0;
  e = 0.1;
  image = imageBlocker(input, n);
  dim = size(image);
  image = orderVec(image, n);
  codeBook = generateCodeBook({}, image, l);
  
  while true
  
    [reg, idx] = defineRegions(image, codeBook); 
    D = distortionRate(reg, codeBook);
    
    if abs(D - D_ant)/D <= e
      break;
    else
      D_ant = D;
      codeBook = generateCodeBook(reg, image, l);
    end
  
  end
  
  %idx = encode(image, reg);
  
  for ii = 1:length(codeBook)
    if isempty(codeBook{ii})
      codeBook{ii} = zeros(n,1);
    end
  end
  
  message = double([NaN; NaN; n; vec(cell2mat(codeBook))]);
  message = double([message; NaN]);
  message = double([message; idx']);
  message(1:2) = dim';
  
end