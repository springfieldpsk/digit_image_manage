function [x,y] = readpt(img,cnt)
%READPT ∂¡»Îµ„

figure ;
imshow(img);
set(gcf,'outerposition',get(0,'screensize'));

[x,y]=ginput(cnt);
close all;
end

