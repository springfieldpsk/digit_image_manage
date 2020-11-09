function NumC
% Number of Connections
% 构造函数Numc 
% 暴力构造所有像素连接
clc
clear
close all
tic
digit = 2^8;               % 预存储 256 ,减少计算
B = zeros(digit,8);        % 初始化 B 矩阵
cbs = dec2bin(0:digit-1);  % 将0-255数值转二进制字符串

for k = 1:digit                      % 枚举cbs中的所有数
    for t = 1:8                      % 对二进制数的每一位进行遍历并存储到矩阵B中
        B(k,t) = str2double(cbs(k,t)); 
    end
end

D = [B(:,1:4), ones(digit,1), B(:,5:8)]; 
% 构造一个新的矩阵 D 即在 0 ~ 255 的所有二进制数的中位插一位1 代表3*3矩阵中的中心已存在

B=[1 4 7;2 5 8;3 6 9];
Bz=B';
% 预处理B矩阵与B的转置矩阵 

P6 = [reshape(Bz,1,[]); fliplr(reshape(Bz,1,[])); reshape(fliplr(B),1,[]); reshape(flipud(B),1,[]);
    reshape(rot90(B),1,[]); reshape(rot90(B,2),1,[]); reshape(rot90(B,3),1,[])];    
% 将B矩阵的7种同构异形体（水平、竖直翻转；正反对角线翻转；旋转90度1-2-3次）全部存储在P6矩阵中
% 即预先指定每次枚举每一个二进制数时，每一位数转移的位置

Q = zeros(7,9); % 初始化Q矩阵

M = D(1,:);    
M = [M ; D(digit,:)];
% 存储结果与M矩阵，并预存储全为0或1的情况

for k = 2:digit-1   
    p = D(k,:);                     % 枚举2-255的所有情况
    for s = 1:7
        Q(s,:) = p(P6(s,:));        % 构造 Q 矩阵，即 当前二进制数按照P6字典进行构建的所有情况
    end
    if ~sum(ismember(Q,M, 'rows'))  % 确认构造的 Q 矩阵是否在 答案矩阵M中存在
        M = [M;p];
    end
end
toc

for k =1:size(M,1)                 
    drawsquare3(reshape(M(k,:),3,[]));      % 绘制答案
    pause(0.1);                             % 暂停 0.1 秒
    saveas(gcf,['Nc',num2str(k),'.png']);   % 以png格式保存绘制结果
    pause(0.1);
end
close all   % 绘制结束后关闭窗口


function drawsquare3(M)
% 绘制函数 drawsquare3 
% M 为当前绘制的构造矩阵
wdth = 30; % wdth 为每个1*1矩形的边长
N = zeros(3*wdth,3*wdth);
% 根据指定边长初始化图像矩阵
for p = 1 : 3
    for q = 1 : 3
        N((p-1)*wdth+1:p*wdth,(q-1)*wdth+1:q*wdth) = 0.5*(1-M(p,q))+0.25;
        % 对((p-1)*wdth+1,(q-1)*wdth+1) , (p*wdth,q*wdth) 的区域填充像素
        % 当指定位置为1时，填充灰度为0.25;当指定位置为0时，填充灰度为0.75
    end
end

subplot(1,3,[1,2]);
imshow(N); % 绘制答案图像
hold on
[X,Y] = meshgrid((0:wdth:3*wdth)+0.5);     % 生成覆盖网格
plot(X,Y,'b',Y,X,'b','LineWidth',2);       % 绘制覆盖网格 线宽=2 颜色为蓝色 
hold off

text(1.45*wdth,1.45*wdth,'$p$','Interpreter','latex','FontSize',wdth,'Color','r');
% 在3*3中点 覆盖字母p 以确认矩阵中点 

B = M([8 7 4 1 2 3 6 9 8]);     
% 通过下标确认二进制串
Q = 1 - B;
% 根据 B 按位取反

Nc4p = 0;
Nc8p = 0;
for k = 1:2:7
    Nc4p = Nc4p + B(k) - prod(B(k:k+2));
    Nc8p = Nc8p + Q(k) - prod(Q(k:k+2));
end
% 计算四邻域与八邻域连接数

text(3.25*wdth,1*wdth,['$N_c^{(4)}(p) $',' = ',num2str(Nc4p)],'Interpreter','latex','FontSize',0.8*wdth,'Color','r');
text(3.25*wdth,2*wdth,['$N_c^{(8)}(p) $',' = ',num2str(Nc8p)],'Interpreter','latex','FontSize',0.8*wdth,'Color','r');
% 显示四邻域与八邻域连接数