function pzyss
clc
clear
close all

function Imarker=EroDilRec(l,len)%l:������ͼ�� len:?
len=2*floor(len/2)+1;
se=strel('disk',len);%�������͸�ʴ����������Ȳ����ĽṹԪ�ض���
%(�÷���SE = strel(shape,parameters) shape������״��diskԲ�νṹԪ�أ�parametersһ�����se�Ĵ�С)
Imarker=imerode(l,se);%��imerode����ʵ��ͼ��ʴ��imerode(l,se).����l�Ǵ������ͼ��se�ǽṹԪ�ض���
se0=strel('disk',3);
for k=1:(len-1)/2
    Imarker=min(imdilate(Imarker,se0),l);%��imdilate����ʵ��ͼ�����ͣ��÷���imerode����.
end
