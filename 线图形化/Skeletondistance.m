function Skeletondistance
% % Skeleton by Distance
clc
clear

Img = rgb2gray(imread('../lena.tiff'));

subplot(121)
imshow(Img)

ImgO = Img<125;                         % 将灰度图像转变为二值图像,把灰度值小于125的赋值为0，大于等于125的赋值为1
[m,n] = size(ImgO);                     % m,n为原始图像的大小

ImgB = padarray(ImgO,[1,1],'replicate');    % 扩张成m+2乘n+2，即上下左右各增加两行/列

G = 255*ImgB;   %%灰度值在[0,255]之间
Flag = 1;  %%定义循环条件
while Flag
    Q = zeros(size(G));
    for p = 2 : m+1
        for q = 2 : n+1
            if ImgB(p-1,q-1)
                Q(p,q) = min([G(p,q),G(p-1,q)+1,G(p+1,q)+1,G(p,q-1)+1,G(p,q+1)+1]);  % 距离变换公式
            end
        end
    end
    if norm(Q-G)<eps   % 当图像Q-G的值几乎不变时，flag变为0，即图像不能再变化时就停止循环
        Flag = 0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    end
    G = Q;  % 不断进行距离变换赋值
end
subplot(122)
imshow(G,[])

