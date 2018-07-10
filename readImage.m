function image = readImage(codeBook, message, n, dim)

  image = {};
  len = length(message);
  kk=1;
  
  for ii = 1:dim(1)
    for jj = 1:dim(2)
    
      if(kk > len)
        image{ii,jj} = zeros(n);
      else
        image{ii,jj} = reshape(codeBook{message(kk)}, n, n);
        kk ++;
      end
    
    end
  end
  
  image = uint8(cell2mat(image));
 
end