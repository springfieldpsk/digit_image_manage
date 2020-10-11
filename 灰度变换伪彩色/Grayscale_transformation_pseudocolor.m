% 通过定义不同灰度所映射的RGB通道灰度以实现灰度变换伪彩色
% gray-R [0,127]=0 [127,191]=0->255 [191,255]=255
% gray-G [0,63]=0->255 [63,191]=255 [191,255]=255->0
% gray-R [0,63]=255 [63,127]=255->0 [127,255]=0

clc
clear 
close all

level=255; % 规定最大灰度值
gray_img=rgb2gray(imread('lena.tiff'));  % 读入图像

[n,m]=size(gray_img);
pc_img=zeros(n,m,3);

for i = 1:n
    for j = 1:m
        nowgray=gray_img(i,j);
        if nowgray <= level/4
            pc_img(i,j,1)=0;
            pc_img(i,j,2)=nowgray*4;
            pc_img(i,j,3)=level;
        elseif nowgray <= level/2
            pc_img(i,j,1)=0;
            pc_img(i,j,2)=level;
            pc_img(i,j,3)=2*level-4*nowgray;
        elseif nowgray <=level*3/4
            pc_img(i,j,1)=4*nowgray-2*level;
            pc_img(i,j,2)=level;
            pc_img(i,j,3)=0;
        else
            pc_img(i,j,1)=level;
            pc_img(i,j,2)=4*(level-nowgray);
            pc_img(i,j,3)=0;
        end
    end
end
% 遍历图像转换

pc_img=uint8(pc_img);

% 绘图
figure
subplot(121);
imshow(gray_img);
subplot(122);
imshow(pc_img);