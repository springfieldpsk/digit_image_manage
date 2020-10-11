clc
clear 
close all

level=256;
% 规定灰度等级
gray_img=rgb2gray(imread('lena.tiff')); 
% 读入图像

noise_img_sp=imnoise(gray_img,'salt & pepper',0.1);
% 添加椒盐噪声
noise_img_gs=imnoise(gray_img,'gaussian');
% 添加高斯噪声

M=1;
m=2;