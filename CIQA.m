% Script deicado `a extraç~ao das informaç~oes referentes à quantizaç~ao adaptativa

input = imread('Image_Database/baboon.bmp');
PSNR = [];
bpp = ((2:9).*(2:9))*0.1;

ii = 7;%for ii = 1:8
  output = QuantEscScript(input, ii+1, 8);
  
  file = fopen('image2.txt');
  fwrite(file, output, 'double');
  fclose(file);
  
  dim = size(output);
  MSE = sum(sum((output - input(1:dim(1),1:dim(2))).^2))/(dim(1)*dim(2));
  PSNR(ii) = 10*log10((2^8 - 1)^2/ MSE);
  label = '';
  imshow(output);
  %imwrite(output,['outputs/CIQA_' num2str(ii) '.bmp']);
%end

%figure
%plot(bpp, PSNR);
%xlabel('Rate [bpp]');
%ylabel('PSNR [dB]');
%title('CIQA');