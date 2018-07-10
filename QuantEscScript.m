function output = QuantEscScript(input, n, m)
  
  input = imageBlocker(input, n);
  [x,y] = size(input);
  output = cell(x,y);
  
  for ii = 1:x
    for jj = 1:y
      
      if ~isempty(input{ii,jj})
        output{ii,jj} = quantEsc(input{ii,jj},m);
      else
        output{ii,jj} = zeros(n);
      end
      
    end
  end
  
  output = uint8(cell2mat(output));
  
end