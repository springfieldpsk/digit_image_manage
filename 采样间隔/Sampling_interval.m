Img=imread("lena.tiff");
% 读入图像

Img512=rgb2gray(Img);
% 转为灰度图
subplot(2,4,1);
imshow(Img512);
xlabel('512×512');

Img256=imresize(Img512,0.5);
% 改变大小
subplot(2,4,2);
imshow(Img256);
xlabel('256×256');

Img128=imresize(Img256,0.5);
% 改变大小
subplot(2,4,3);
imshow(Img128);
xlabel('128×128');

Img64=imresize(Img128,0.5);
% 改变大小
subplot(2,4,4);
imshow(Img64);
xlabel('64×64');

Img32=imresize(Img64,0.5);
% 改变大小
subplot(2,4,5);
imshow(Img32);
xlabel('32×32');

Img16=imresize(Img32,0.5);
% 改变大小
subplot(2,4,6);
imshow(Img16);
xlabel('16×16');

Img8=imresize(Img16,0.5);
% 改变大小
subplot(2,4,7);
imshow(Img8);
xlabel('8×8');

Img4=imresize(Img8,0.5);
% 改变大小
subplot(2,4,8);
imshow(Img4);
xlabel('4×4');



