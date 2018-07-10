function [message, D] = cimap(input, m)

  [x,y,~] = size(input);
  image = colorBlocker(input, m);
  codeBook = generateCodeBook({}, image, m);
  e = 0.1;
  D_ant = 0;
  
  while true
  
    [reg, idx] = defineRegions(image, codeBook); 
    D = distortionRate(reg, codeBook);
    
    if abs(D - D_ant)/D <= e
      break;
    else
      D_ant = D;
      codeBook = generateCodeBook(reg, image, m);
    end
  
  end
  
  %idx = encode(image, reg);
  
  for ii = 1:length(codeBook)
    if isempty(codeBook{ii})
      codeBook{ii} = zeros(m,1);
    end
  end
  
  message = double([double(x); double(y); m; vec(cell2mat(codeBook))]);
  message = double([message; NaN]);
  message = double([message; idx']);
  message(1:2) = [x;y];

end 