% Script deicado `a extraç~ao das informaç~oes referentes ao CIMap

input = imread('Image_Database/baboon_colour.bmp');
input = input(200:300,200:300,:);
bpp = ((2:9).*(2:9))*(1/64);
PSNR = [];

for ii = 1:8
  [output, MSE] = cimap(input, 2^ii);
  PSNR(ii) = 10*log10((2^6 - 1)/ MSE);
  image = cimapDecoder(output);
  imwrite(image,[num2str(2^ii) 'cores.bmp']);
end

figure
plot(bpp, PSNR(end:-1:1));
ylabel('PSNR [dB]');
xlabel('Rate [bpp]');
title('CIMap');