clc
clear 
close all

tic
level=256;
% 规定灰度等级
gray_img=double(rgb2gray(imread('../lena.tiff'))/255); 
% 读入图像

fft_img=fft2(gray_img);
ffts_img=fftshift(fft_img);
ifft_img=real(ifft2(fft_img));
ifft_img=im2uint8(mat2gray(ifft_img));

figure;
subplot(131),imshow(gray_img);
subplot(132),imshow(log(abs(ffts_img)+1),[]);
subplot(133),imshow(ifft_img);

toc

