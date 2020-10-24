% 几何校正是通过畸变图像与正确图像上的多个相同点，以建立相应的坐标映射，以
% 使得图像的几何关系得到改正
clc
clear 
close all

tic
Org_img=imread('lena_distort.png');
model_img=imread('../lena.tiff');

Mode = 2;

if Mode == 1 
    [Org_x,Org_y]=readpt(Org_img,4);
    [model_x,model_y]=readpt(model_img,4);
else 
    Org_y=[1;512;102;410];
    Org_x=[128;1;410;512];
    model_x=[1,512,1,512];
    model_y=[1,1,512,512];
end 

model=build(model_x,model_y);

A=model\Org_x;
B=model\Org_y;
% 计算变换函数

[n,m,k]=size(Org_img);
del_img_near=zeros(n,m,k);
del_img_bil=zeros(n,m,k);

for i = 1:n
    for j = 1:m
        tmp=[i*j,i,j,1];
        x=tmp*A;y=tmp*B;
        x_=round(x);y_=round(y);
        if x_>=1 && x_<=n && y_>=1 && y_<=m 
            for c = 1: k
                del_img_near(j,i,c)=Org_img(x_,y_,c);
            end
        end
        % 最邻近元法求

        xl=floor(x);xr=ceil(x);
        yl=floor(y);yr=ceil(y);

        if xl >=1 && xl <=n && xr >=1 && xr<=n && yl>=1 && yl<=m && yr>=1 && yr<=m
            for c = 1: k
                del_img_bil(j,i,c)=(x-xl)*(y-yl)*Org_img(xl,yl,c)+...
                        (x-xl)*(yr-y)*Org_img(xl,yr,c)+...
                        (xr-x)*(y-yl)*Org_img(xr,yl,c)+...
                        (xr-x)*(yr-y)*Org_img(xr,yr,c);
            end
        end
        % 双线性内插值法求
    end
end




figure;
subplot(131),imshow(Org_img),title('Distorted');
set(gca,'FontSize',18);

subplot(132),imshow(uint8(del_img_near)),title('Rectification');
set(gca,'FontSize',18);

subplot(133),imshow(uint8(del_img_bil)),title('Bil');
set(gca,'FontSize',18);

set(gcf,'OuterPosition',get(0,'ScreenSize'));

toc