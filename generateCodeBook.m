function codeBook = generateCodeBook(reg, input, l)
  
  codeBook = {};
  dim = length(input);
  
  if isempty(reg)
    
    delta = floor(dim/l);
    idx = 1:delta:(l*delta);
    codeBook = input(idx);
    
    return;
  
  end
  
  for ii = 1:l
    if ~isempty(reg{ii})
      if size(reg{ii},2) == 1
        codeBook{ii} = reg{ii};
      else
        codeBook{ii} = mean(reg{ii}')';
      end
    else
      idx = randi(dim);
      codeBook{ii} = input{idx};
    end
  end
  
end