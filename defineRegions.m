function [regions, idx] = defineRegions(input, codeBook)

  input = cell2mat(input);
  dim = size(input,2);
  regions = cell(size(codeBook));
  len = length(codeBook);
  idx = [];

  for ii = 1:dim
  
    k = 1;
    min_dist = sum((input(:,ii) - codeBook{1}).^2);
  
    for jj = 2:len
    
      if ~isempty(codeBook{jj})
        dist = sum((input(:,ii) .- codeBook{jj}).^2);
        if dist < min_dist
          min_dist = dist;
          k = jj;
        end
      end
    
    end
    
    idx(ii) = k;
    regions{idx(ii)} = [regions{idx(ii)} input(:,ii)];
    
  end
  
  regions;

end