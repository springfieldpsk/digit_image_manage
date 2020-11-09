function Skeletondistance
% Skeleton by Distance
% 线图形化
tic
clc
clear

Img = rgb2gray(imread('../lena.tiff')); % 读入图像

ImgO = Img < 125; 
% 将灰度图像转变为二值图像,把灰度值小于125的赋值为0，大于等于125的赋值为1
[m, n] = size(ImgO); 
% m,n为原始图像的大小

ImgB = padarray(ImgO, [1, 1], 'replicate'); 
% 扩张成m+2乘n+2，即上下左右各增加两行/列

G = 255 * ImgB; % 灰度值在[0,255]之间
Q = zeros(size(G)); % 初始化Q矩阵

while 1
    for p = 2:m + 1
        for q = 2:n + 1
            if ImgB(p - 1, q - 1)
                Q(p, q) = min([G(p, q), G(p - 1, q) + 1, G(p + 1, q) + 1, G(p, q - 1) + 1, G(p, q + 1) + 1]); % 距离变换公式
            end
        end
    end

    if norm(Q - G) < eps
    % 当图像Q-G的值几乎不变时，即图像不能再变化时就停止循环
        break;
    end
    G = Q; % 生成新图覆盖旧图
end

subplot(121), imshow(Img);
subplot(122), imshow(G, []);
% 绘制图像

toc
