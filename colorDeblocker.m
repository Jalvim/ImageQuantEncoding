function image = colorDeblocker(codeBook, message, dim)

  image = zeros(dim(1), dim(2), 3);
  kk = 1;
  
  for ii = 1:dim(1)
    for jj = 1:dim(2)
    
      image(ii,jj,:) = codeBook{message(kk)};
      kk++;
    
    end
  end
  
  image = uint8(image);

end