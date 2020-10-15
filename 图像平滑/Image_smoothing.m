clc
clear 
close all

tic
level=256;
% 规定灰度等级
gray_img=rgb2gray(imread('../lena.tiff')); 
% 读入图像

noise_img_sp=imnoise(gray_img,'salt & pepper',0.1);
% 添加椒盐噪声
noise_img_gs=imnoise(gray_img,'gaussian');
% 添加高斯噪声

med_img_sp=median_filtering(noise_img_sp);
% 椒盐噪声中值滤波平滑
med_img_gs=median_filtering(noise_img_gs);
% 高斯噪声中值滤波平滑

avg_img_sp=Average_filtering(noise_img_sp);
% 椒盐噪声均值滤波平滑
avg_img_gs=Average_filtering(noise_img_gs);
% 高斯噪声均值滤波平滑

figure;
subplot(151);imshow(gray_img),title("原始图");
subplot(152);imshow(noise_img_sp),title("椒盐噪声图");
subplot(153);imshow(med_img_sp),title("椒盐噪声中值滤波平滑图");
subplot(154);imshow(noise_img_gs),title("高斯噪声图");
subplot(155);imshow(med_img_gs),title("高斯噪声中值滤波平滑图");

figure;
subplot(151);imshow(gray_img),title("原始图");
subplot(152);imshow(noise_img_sp),title("椒盐噪声图");
subplot(153);imshow(avg_img_sp),title("椒盐噪声均值滤波平滑图");
subplot(154);imshow(noise_img_gs),title("高斯噪声图");
subplot(155);imshow(avg_img_gs),title("高斯噪声均值滤波平滑图");
toc

