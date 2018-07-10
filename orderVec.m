function output = orderVec(input, l)
  
  dim = size(input);
  output = {};
  kk = 1;
  
  for ii = 1:dim(1)
    for jj = 1:dim(2)
    
      output{kk} = vec(input{ii,jj});
      kk ++;
      
    end
  end
  
end