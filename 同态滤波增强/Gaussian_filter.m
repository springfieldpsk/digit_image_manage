function [Filer_img] = Gaussian_filter(gray_img,d0,n,rh,rl)
% Gaussian 高斯同态滤波器
% H(u,v)=(rh-rl)*exp(-n*(D/d02))+rl

[r,c]=size(gray_img);
x0=round(r/2);
y0=round(c/2);
d02=d0^2;
h=zeros(r,c);

for i = 1:r
    for j= 1:c
        D=(i-x0)^2+(j-y0)^2;
        h(i,j)=(rh-rl)*exp(-n*(D/d02))+rl;
    end
end

Filer_img = ifft2(h.*fft2(gray_img));

end