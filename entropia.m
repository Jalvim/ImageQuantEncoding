function ent = entropia(input)

  tam = size(input,1) * size(input,2);
  pix = unique(input);
  prob = [];
  
  for ii = 1:length(pix)
    prob(ii) = sum(sum(pix(ii) == input))/tam;
  end
  
  ent = sum(-prob.*log2(prob));

end