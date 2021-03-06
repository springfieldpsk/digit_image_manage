% 同态滤波增强
% 采用线性滤波的方法，而非加性信号组合常用同态滤波的技术将非线性问题转化成线性问题处理，
% 即先对非线性（乘性或者卷积性）混杂信号作某种数学运算，变换成加性的。
% 然后用线性滤波方法处理，最后作反变换运算

clc
clear 
close all

tic

gray_img=double(rgb2gray(imread('1.jpg'))); 
% 读入图像
ln_img=log(gray_img+1); % 图像取对数 做快速傅里叶变换

out_ln_img=Gaussian_filter(ln_img,10,2,4.7,0.5); % 高斯滤波器处理
% [out_ln_img,out_lns_img]=Butterworth_Highpass(ln_img,10,2,1.0,0.3); % 使用Butterworth低通滤波器处理

Filer_img = real(exp(out_ln_img)-1);
% ffts_img=fftshift(fft2(gray_img)); % 做快速傅里叶变换
% Filers_img=fftshift(fft2(Filer_img)); % 做快速傅里叶变换

figure;
subplot(121),imshow(gray_img,[]),title('Original Image');
subplot(122),imshow(Filer_img ,[]),title('Homomorphic Filtered');
toc

