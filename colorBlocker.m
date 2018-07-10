function output = colorBlocker(input, m);

  [x, y, ~] = size(input);
  kk = 1;
  output = {}
  
  for ii = 1:x
    for jj = 1:y
    
      output{kk} = [input(ii,jj,1); input(ii,jj,2); input(ii,jj,3)];
      kk++;
     
    end
  end

end 