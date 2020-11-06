function pzyss
clc
clear
close all

function Imarker=EroDilRec(l,len)%l:待处理图像 len:?
len=2*floor(len/2)+1;
se=strel('disk',len);%用于膨胀腐蚀及开闭运算等操作的结构元素对象
%(用法：SE = strel(shape,parameters) shape代表形状，disk圆形结构元素；parameters一般控制se的大小)
Imarker=imerode(l,se);%用imerode函数实现图像腐蚀；imerode(l,se).其中l是待处理的图像，se是结构元素对象
se0=strel('disk',3);
for k=1:(len-1)/2
    Imarker=min(imdilate(Imarker,se0),l);%用imdilate函数实现图像膨胀；用法与imerode相似.
end
