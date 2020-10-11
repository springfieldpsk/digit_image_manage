Img=imread("lena.tiff");
% 读入图像

Img256=rgb2gray(Img);
Img256=histeq(Img256,255);
% 转为灰度图

Img128=Trangray(Img256, 1);
Img64=Trangray(Img256, 2);
Img32=Trangray(Img256, 3);
Img16=Trangray(Img256, 4);
Img8=Trangray(Img256, 5);
Img4=Trangray(Img256, 6);
Img2=Trangray(Img256, 7);
Img1=Trangray(Img256, 8);

figure;
subplot(2,4,1);imshow(Img128);xlabel('128');
subplot(2,4,2);imshow(Img64);xlabel('64');
subplot(2,4,3);imshow(Img32);xlabel('32');
subplot(2,4,4);imshow(Img16);xlabel('16');
subplot(2,4,5);imshow(Img8);xlabel('8');
subplot(2,4,6);imshow(Img4);xlabel('4');
subplot(2,4,7);imshow(Img2);xlabel('2');
subplot(2,4,8);imshow(Img1);xlabel('1');

