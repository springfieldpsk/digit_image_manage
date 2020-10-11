clc
clear 
close all

level=256;
% 规定灰度等级
gray_img=rgb2gray(imread('lena.tiff')); 
% 读入图像

N=imhist(gray_img);
sumN=sum(N);
P=zeros(256);
S=zeros(256);

for i = 1:size(N)
    P(i)=N(i)/sumN;
    if i == 1
        S(i)=P(i);
    else 
        S(i)=S(i-1)+P(i);
    end
end
% 计算原始直方图分布概率p(i)、概率累计值s(i)

r=round((level-1).*S+0.5);
% 根据公式求取像素映射关系

equal_img=gray_img;
for i = 1:size(equal_img(:))
    tmp = equal_img(i);
    if tmp == 0
        equal_img(i)=1;
    else 
        equal_img(i)=r(tmp);
    end
end
% 灰度映射

figure
subplot(2,2,1);
imshow(gray_img),title('Original image');
set(gca,'FontSize',18);
subplot(2,2,3);
imshow(equal_img),title('Equalized image');
set(gca,'FontSize',18);

subplot(2,2,2);
[counts,x]=imhist(gray_img,level);
bar(x,counts/numel(gray_img),'FaceColor','g','EdgeColor','r'),title('Gray-Level Histogram');  
set(gca,'FontSize',18);

subplot(2,2,4);
[counts,x]=imhist(equal_img,level);
bar(x,counts/numel(equal_img),'FaceColor','g','EdgeColor','r'),title('Gray-Level Histogram');    
set(gca,'FontSize',18);
% 绘制图像



