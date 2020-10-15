clc
clear 
close all

tic
level=256;
% 规定灰度等级
gray_img=rgb2gray(imread('../lena.tiff')); 
% 读入图像

Roberts_x=[-1 0 ; 0 1]; % Roberts_x算子
Roberts_y=[0 -1 ; 1 0]; % Roberts_y算子
Roberts_img=sharpening_model(gray_img,Roberts_x,Roberts_y); % Roberts算子图像

Prewitt_x=[-1 0 1;-1 0 1;-1 0 1]; % Prewitt_x算子
Prewitt_y=[-1 -1 -1;0 0 0;1 1 1]; % Prewitt_y算子
Prewitt_img=sharpening_model(gray_img,Prewitt_x,Prewitt_y); % Prewitt算子图像

Sobel_x=[-1 0 1;-2 0 2;-1 0 1]; % Sobel_x算子
Sobel_y=[-1 -2 -1;0 0 0;1 2 1]; % Sobel_y算子
Sobel_img=sharpening_model(gray_img,Sobel_x,Sobel_y); % Sobel算子图像

laplacian=[0 1 0;1 -4 1;0 1 0]; % laplacian算子
laplacian_gr=[0 -1 0;-1 5 -1;0 -1 0]; % laplacian增强算子
laplacian_img=sharpening_model(gray_img,laplacian); % laplacian算子图像
laplacian_gr_img=sharpening_model(gray_img,laplacian_gr); % laplacian增强算子图像


figure;
subplot(231),imshow(gray_img),title("原图");
subplot(232),imshow(Roberts_img),title("robert算子的图像");
subplot(233),imshow(Prewitt_img),title("Prewitt算子的图像");
subplot(234),imshow(Sobel_img),title("Sobel算子的图像");
subplot(235),imshow(laplacian_img),title("laplacian算子的图像");
subplot(236),imshow(laplacian_gr_img),title("laplacian增强算子的图像");

toc

