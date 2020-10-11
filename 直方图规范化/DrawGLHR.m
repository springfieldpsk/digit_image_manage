function DrawGLHR
% DRAW Gray-Level Histogram Regulation
clc
clear
close all

L = 2^8;
% ImgO = (rgb2gray(imread('flower1.jpg')));                 % % ImgO - Original Image
% ImgO = double(rgb2gray(imread('E:\aa\l.tif')));           % % ImgO - Original Image
ImgL = double(rgb2gray(imread('ttp.png')));                 % % ImgO - Original Image

[freqsL,ncsfsL] = ncsf(ImgL);   % % 原始图像的归一化累积分布函数
subplot(2,3,1)
imshow(ImgL,[0,L-1])
xlabel(['Gray levels: ',int2str(L-sum(~freqsL))])
title('Original Image')
set(gca,'FontSize',18)
%
subplot(2,3,4)
% size(freqsO)
bar(0:L-1,freqsL/numel(ImgL),'FaceColor','g','EdgeColor','r')
% axis([0 cfreqs(end) 0 1/50])
title('Gray-Level Histogram')
set(gca,'FontSize',18)
%

% ImgR = double(rgb2gray(imread('abc.jpg'))); % % ImgR - Reference Image
% ImgR = double((imread('abc.jpg'))); % % ImgR - Reference Image
ImgR = (rgb2gray(imread('flower1.jpg')));   % % ImgR - Reference Image

[freqsR,ncsfsR] = ncsf(ImgR);   % % 参考图像的归一化累积分布函数
subplot(2,3,2)
imshow(ImgR,[0,L-1])
xlabel(['Gray levels: ',int2str(L-sum(~freqsR))])
title('Reference Image')
set(gca,'FontSize',18)
%
subplot(2,3,5)
bar(0:L-1,freqsR/numel(ImgR),'FaceColor','g','EdgeColor','r')
% axis([0 cfreqs(end) 0 1/50])
title('Gray-Level Histogram')
set(gca,'FontSize',18)

% % Benchmarking intervals
BenInvs = zeros(L+1,1);
BenInvs(2:end-1) = ncsfsR(1:end-1)+diff(ncsfsR)/2;
BenInvs(end) = 1.1;
%
Labels = zeros(L,1);
for u = 1 : L
    for v = 1 : L
        if (BenInvs(v)<=ncsfsL(u)) && (ncsfsL(u)<=BenInvs(v+1))
            Labels(u) = v-1;
        end
    end
end
%
% Labels = recode(Labels);
%
Jmg = ImgL;
for k = 1 : L
    Jmg(ImgL==k-1) = Labels(k);
end
%
subplot(2,3,3)
imshow(Jmg,[])
xlabel(['Gray levels: ',int2str(L-sum(~ncsf(Jmg)))])
title('Regularized Image')
set(gca,'FontSize',18)
%
freqs = zeros(Labels(end)+1,1);
for k = 1 : L
    freqs(k) = sum(Jmg(:)==k-1);
end
subplot(2,3,6)
bar(0:Labels(end),freqs/numel(Jmg),'FaceColor','g','EdgeColor','r')
% axis([0 cfreqs(end) 0 1/50])
title('Gray-Level Histogram')
set(gca,'FontSize',18)
%
set(gcf,'OuterPosition',get(0,'ScreenSize'));

% function vec = recode(vec)
% % 对累积直方图乘以拉伸系数后四舍五入取整得新灰度值重新按递增顺序编码
% vec = vec - vec(1);
% dv = diff(vec);
% for k = length(dv):-1:1
%     if dv(k)>1
%         vec(k+1:end) = vec(k+1:end)-dv(k)+1;
%     end
% end

function [freqs,ncsfreqs] = ncsf(Img)
% % Normalized Cumulative Summation of Frequencies
freqs = zeros(256,1);       % % 灰度级数假定为256
for k = 1 : length(freqs)
    freqs(k) = sum(Img(:)==k-1);
end
% freqs - 分布函数
ncsfreqs = cumsum(freqs/numel(Img));
