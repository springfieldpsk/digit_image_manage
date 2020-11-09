function pzyss
% 膨胀与腐蚀（收缩）函数
clc
clear
close all

img=[1 0 0 1 0 0
     1 0 1 1 1 0
     1 1 1 0 0 0
     0 1 1 0 0 0
     0 0 1 0 0 0
     0 0 0 0 0 0];
% 测试用二值图

SE = [0 1 0 
      1 1 1 
      0 1 0];
% 自定义结构元素

d_img=imdilate(img, SE);    % 利用 SE 作为结构元素对测试用二值图img进行膨胀
r_img=imerode(img, SE);     % 利用 SE 作为结构元素对测试用二值图img进行腐蚀

figure; 
subplot(1,3,1),imshow(img);
subplot(1,3,2),imshow(d_img);
subplot(1,3,3),imshow(r_img);
% 显示第一个实验结果

SE = strel('disk',3);
% 利用strel 生成结构元素

d_img=imdilate(img, SE); % 利用 SE 作为结构元素对测试用二值图img进行膨胀
r_img=imerode(img, SE);  % 利用 SE 作为结构元素对测试用二值图img进行腐蚀

figure; 
subplot(1,3,1),imshow(img);
subplot(1,3,2),imshow(d_img);
subplot(1,3,3),imshow(r_img);
% 显示第二个实验结果