Img=imread('brige.png');

Imggray=rgb2gray(Img);
Imgbw=im2bw(Img,0.62);

figure;

subplot(1,3,1);
imshow(Imggray);

subplot(1,3,2);
[counts,x]=imhist(Imggray,256);
stem(x,counts);

subplot(1,3,3);
imshow(Imgbw);

