% ����У����ͨ������ͼ������ȷͼ���ϵĶ����ͬ�㣬�Խ�����Ӧ������ӳ�䣬��
% ʹ��ͼ��ļ��ι�ϵ�õ�����
clc
clear 
close all

Org_img=imread('lena_distort.png');
model_img=imread('../lena.tiff');


Mode = 2;

if Mode == 1 
    [Org_x,Org_y]=readpt(Org_img,4);
    [model_x,model_y]=readpt(model_img,4);
else 
    Org_x=[512,410,102,1];
    Org_y=[1,512,410,128];
    model_x=[512,512,1,512];
    model_y=[1,512,512,1];
end 

Org=[Org_x;Org_y];
model=build(model_x,model_y);
imodel=inv(model);

% h=inv(model)*Org;
