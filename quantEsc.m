function yi = quantEsc(x, m)
% Funcao responsavel por funcionar como um quantizador escalar o vetor de 
% dados 'x'. Para projetar o quantizador uniforme de 'm' niveis, utiliza-se 
% como entrada da funcao a variavel 'l', que indica o numero de passos.

  dim = size(x);
  x = double(vec(x));
  x_max = max(x);
  x_min = min(x);
  delta = (x_max + x_min)/m;
  yi = nan(size(x));
  x_int = x_min:delta:x_max;
  
  for ii = 1:length(x)
    [~ ,idx] = min(abs(x(ii)-x_int));
    yi(ii) = x_int(idx);
  end
  
  yi = uint8(reshape(yi, dim));

end
