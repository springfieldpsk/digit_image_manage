function Numc
% Number of Connections
tic
clc
clear
close all

B = zeros(2^8,8);       
cbs = dec2bin(0:2^8-1);     % % 将0-255数值转二进制字符串
disp(cbs);

for k = 1:2^8
    for t = 1:8
        B(k,t) = str2double(cbs(k,t));  % % 依次将0-1存储到矩阵B中
    end
end
D = [B(:,1:4), ones(2^8,1), B(:,5:8)];  % % 最中间元素p=1
%
A = 1:9;
B = reshape(A,3,[]);

P6 = [reshape(B',1,[]); fliplr(reshape(B',1,[])); reshape(fliplr(B),1,[]); reshape(flipud(B),1,[]);
    reshape(rot90(B),1,[]); reshape(rot90(B,2),1,[]); reshape(rot90(B,3),1,[])];    % % 共有7种同构异形体（水平、竖直翻转；正反对角线翻转；旋转90度1-2-3次）
Q = zeros(7,9);
%
M = D(1,:);     % % 存储干货
for k = 2:2^8
    p = D(k,:);     % % 依次考察新取p的7种异形体是否已存在
    for s = 1:7
        Q(s,:) = p(P6(s,:));
    end
    if ~sum(ismember(Q,M, 'rows'))      % % 只有不存在才添加！
        M = [M;p];
    end
end

toc
for k =1:size(M,1)
    drawsquare3(reshape(M(k,:),3,[]))
    pause(0.1)
    saveas(gcf,['Nc',num2str(k),'.png'])
    pause(0.1)
end

function drawsquare3(M)
wdth = 30;
N = zeros(3*wdth);
%生成90X90的初始化矩阵
for p = 1 : 3
    for q = 1 : 3
        N((p-1)*wdth+1:p*wdth,(q-1)*wdth+1:q*wdth) = 0.5*(1-M(p,q))+0.25;
    end
end%对矩阵进行操作
subplot(1,3,[1,2])
imshow(N)%显示矩阵
hold on
[X,Y] = meshgrid((0:wdth:3*wdth)+0.5);
plot(X,Y,'b',Y,X,'b','LineWidth',2)%绘制图
hold off
%添加文本
text(1.45*wdth,1.45*wdth,'$p$','Interpreter','latex','FontSize',wdth,'Color','r')

B = M([8 7 4 1 2 3 6 9 8]);     % % 故意多补了一位
Q = 1 - B;
Nc4p = 0;
Nc8p = 0;
for k = 1:2:7
    Nc4p = Nc4p + B(k) - prod(B(k:k+2));
    Nc8p = Nc8p + Q(k) - prod(Q(k:k+2));
end
%添加文本
text(3.25*wdth,1*wdth,['$N_c^{(4)}(p) $',' = ',num2str(Nc4p)],'Interpreter','latex','FontSize',0.8*wdth,'Color','r')
text(3.25*wdth,2*wdth,['$N_c^{(8)}(p) $',' = ',num2str(Nc8p)],'Interpreter','latex','FontSize',0.8*wdth,'Color','r')
