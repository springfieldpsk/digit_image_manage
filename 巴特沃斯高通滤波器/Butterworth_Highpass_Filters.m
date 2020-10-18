clc
clear 
close all

tic

d0=10; % 设置截止频率
n=2; % 设置阶数
gray_img=rgb2gray(imread('../lena.tiff')); 
% 读入图像

[r,c]=size(gray_img);
R=r*2;
C=r*2;

Filer_t_img=zeros(R,C);
% 对图像进行0填充，得到大小为P*Q的图像，主要是为了避免在循环卷积中出现的缠绕错误。
% 当两个矩阵大小相同时，P≥2m-1，Q≥2n-1时可以避免环绕错误。
% 由于对于偶数尺寸的矩阵计算其傅里叶变换较快，因此P取2m，Q取2n。

for i = 1:r
    for j = 1:c
        Filer_t_img(i,j) = double(gray_img(i,j)) * (-1)^(i+j);
    end
end
% 图像乘以(-1)^(x+y)，再对图像进行傅里叶变换可以得到将原点移到中心的傅里叶变换。
% 这样，对于F(u,v)来说，中心的频率最低，四周的频率较高。
% 每一点的值表示该频率对于的幅度。
% 在matlab中，也可以不乘以(-1)^(x+y)，直接对填充后的图像进行傅里叶变换，
% 之后使用fftshift函数对其傅里叶变换进行中心化。得到的结果是一样的。

Filer_t_img = fft2(Filer_t_img); % 快速傅里叶变换
ffts_img = Filer_t_img ;
h=zeros(R,C);
d02n=d0^(2*n); % 预处理
for i = 1:R
    for j = 1:C
        D=(i-(r+1))^2+(j-(c+1))^2;
        h(i,j)=1/(1+(D^n)/d02n);
    end
end
% 生成滤波函数，此时图形中心点为(r+1,c+1)

Filer_t_img = Filer_t_img .* h; % 进行滤波
Filers_img = Filer_t_img; % 得到的频谱已经过中心化处理

Filer_t_img = real(ifft2(Filer_t_img)); % 反fft 由频域转换为图像域
Filer_img= zeros(r,c);

for i = 1:r
    for j = 1:c
        Filer_img(i,j) = Filer_t_img(i,j)*(-1)^(i+j);
    end
end
Fmax = max(Filer_img(:));
Fmin = min(Filer_img(:));
len=Fmax-Fmin;

for i = 1: r
    for j = 1: c
        Filer_img(i,j)=uint8(255*(Filer_img(i,j)-Fmin)/len);
    end
end
Filer_img=uint8(Filer_img);

figure;
subplot(221),imshow(gray_img);
subplot(222),imshow(log(abs(ffts_img)+1),[]);
subplot(223),imshow(Filer_img);
subplot(224),imshow(log(abs(Filers_img)+1),[]);


toc

