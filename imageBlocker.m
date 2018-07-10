function output = imageBlocker(input, n)

  dim = size(input);
  output = {};
  resto = mod(dim, n);
  x = dim(1) - resto(1);
  y = dim(2) - resto(2);
  vecx = 1:n:x;
  vecy = 1:n:y;
  
  for ii = 1:length(vecx)
    for jj = 1:length(vecy)
      output{ii,jj} = input(vecx(ii):(vecx(ii)+n-1), vecy(jj):(vecy(jj)+n-1));
    end
  end

end