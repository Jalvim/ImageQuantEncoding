function D = distortionRate(reg, codeBook)
  
  len = length(reg);
  D = zeros(1,len);
  
  for ii = 1:len
    m = size(reg{ii},2);
    
    if ~isempty(reg{ii})
      for jj = 1:m
   
        D(ii) += norm(double(codeBook{ii}) - double(reg{ii}(:,jj)));
    
      end
      D(ii) = D(ii)/m; 
    end
  
  end

  D = sum(D)/length(D);
  
end