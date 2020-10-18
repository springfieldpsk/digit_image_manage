% 同态滤波增强
% 采用线性滤波的方法，而非加性信号组合常用同态滤波的技术将非线性问题转化成线性问题处理，
% 即先对非线性（乘性或者卷积性）混杂信号作某种数学运算，变换成加性的。
% 然后用线性滤波方法处理，最后作反变换运算

clc
clear 
close all

tic
level=255;
% 规定灰度等级
gray_img=double(rgb2gray(imread('../lena.tiff'))/level); 
% 读入图像

ffts_img=fft2(gray_img); % 做快速傅里叶变换
ffts_img=fftshift(ffts_img);  

ln_img=log(gray_img+1); % 图像取对数

[out_ln_img,out_lns_img]=Butterworth_Highpass(ln_img,10,2); % 使用Butterworth低通滤波器处理

Filer_img=exp(out_ln_img)-1; % 结果图像
Filers_img=fft2(Filer_img); % 做快速傅里叶变换
Filers_img=fftshift(Filers_img);  
Filer_img=im2uint8(mat2gray(Filer_img));

figure;
subplot(221),imshow(gray_img);
subplot(222),imshow(log(abs(ffts_img)+1),[]);
subplot(223),imshow(Filer_img);
subplot(224),imshow(log(abs(Filers_img)+1),[]);

toc

