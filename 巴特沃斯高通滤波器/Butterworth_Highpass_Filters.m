clc
clear 
close all

tic
level=255;
% 规定灰度等级
gray_img=double(rgb2gray(imread('../lena.tiff'))/255); 
% 读入图像

fft_img=fft2(gray_img);
ffts_img=fftshift(fft_img);

[n,m]=size(fft_img);
x0=round(n/2);
y0=round(m/2);

for i = 1:n
    for j = 1:m
        d=sqrt((i-x0)^2+(j-y0)^2);
        
    end
end


Filer_img=real(ifft2(fft_img));
Filer_img=im2uint8(mat2gray(Filer_img));

figure;
subplot(131),imshow(gray_img);
subplot(132),imshow(log(abs(ffts_img)+1),[]);
subplot(133),imshow(Filer_img);

toc

