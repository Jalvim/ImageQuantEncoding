% Script deicado `a extraç~ao das informaç~oes referentes à quantizaç~ao vetorial

input = imread('Image_Database/baboon.bmp');
bpp = ((2:9).*(2:9))*(1/64);
PSNR = [];

ii = 2; %for ii = 1:8
  [output, MSE] = quantVecEncoder(input, 64, ii+1);
  
  file = fopen('image1.txt');
  fwrite(file, output, 'double');
  out = fread(file, 'double');
  fclose(file);
  
  PSNR(ii) = 10*log10((2^8 - 1)^2/ MSE);
  image = quantVecDecoder(output);
  imshow(image,[]);
  imwrite(image,'CIVQ.png');
%end

%figure
%plot(bpp, PSNR);
%ylabel('PSNR [dB]');
%xlabel('Rate [bpp]');
%title('CIVQ');