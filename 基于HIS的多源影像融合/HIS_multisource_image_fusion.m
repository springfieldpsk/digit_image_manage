% 通过HIS变化将多光谱图像转换为HIS图像，并进行放大处理
% 以适配高分辨率影像，将直方图规定化后的高分辨率影像替换放大后I图层后反变换
% 即得到融合影像
clc
clear 
close all

tic

level=255; % 设置灰度等级
Img_pan=imread("Pan.jpg");
Img_hps=imread("hyperspectral.jpg");
% 读入图像

Img_hps_gr=imresize(Img_hps,size(Img_pan)); % 放大图像至高分辨率图像大小
Img_his_gr=rgb2hsv(Img_hps_gr); % 转换色域

[Icount,~]=imhist(Img_his_gr(:,:,3)); 
Img_his_gr(:,:,3)=histeq(Img_pan,Icount);
% 根据Img_his I色域 进行直方图规定化

Img_fusion=hsv2rgb(Img_his_gr)/level;
% 转换回rgb色域

figure;
subplot(131),imshow(Img_pan);
xlabel(['Size:',int2str(size(Img_pan,1)),'\times',int2str(size(Img_pan,2))]);
title('Panchromatic');
set(gca,'FontSize',18);

subplot(132),imshow(Img_hps);
xlabel(['Size:',int2str(size(Img_hps,1)),'\times',int2str(size(Img_hps,2))]);
title('Hyperspectral');
set(gca,'FontSize',18);

subplot(133),imshow(Img_fusion);
xlabel(['Size:',int2str(size(Img_fusion,1)),'\times',int2str(size(Img_fusion,2))]);
title('Fused');
set(gca,'FontSize',18);

set(gcf,'OuterPosition',get(0,'ScreenSize'));
% 输出
toc