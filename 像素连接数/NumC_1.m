function Numc
% Number of Connections
tic
clc
clear
close all

B = zeros(2^8,8);       
cbs = dec2bin(0:2^8-1);     % % ��0-255��ֵת�������ַ���
disp(cbs);

for k = 1:2^8
    for t = 1:8
        B(k,t) = str2double(cbs(k,t));  % % ���ν�0-1�洢������B��
    end
end
D = [B(:,1:4), ones(2^8,1), B(:,5:8)];  % % ���м�Ԫ��p=1
%
A = 1:9;
B = reshape(A,3,[]);

P6 = [reshape(B',1,[]); fliplr(reshape(B',1,[])); reshape(fliplr(B),1,[]); reshape(flipud(B),1,[]);
    reshape(rot90(B),1,[]); reshape(rot90(B,2),1,[]); reshape(rot90(B,3),1,[])];    % % ����7��ͬ�������壨ˮƽ����ֱ��ת�������Խ��߷�ת����ת90��1-2-3�Σ�
Q = zeros(7,9);
%
M = D(1,:);     % % �洢�ɻ�
for k = 2:2^8
    p = D(k,:);     % % ���ο�����ȡp��7���������Ƿ��Ѵ���
    for s = 1:7
        Q(s,:) = p(P6(s,:));
    end
    if ~sum(ismember(Q,M, 'rows'))      % % ֻ�в����ڲ���ӣ�
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
%����90X90�ĳ�ʼ������
for p = 1 : 3
    for q = 1 : 3
        N((p-1)*wdth+1:p*wdth,(q-1)*wdth+1:q*wdth) = 0.5*(1-M(p,q))+0.25;
    end
end%�Ծ�����в���
subplot(1,3,[1,2])
imshow(N)%��ʾ����
hold on
[X,Y] = meshgrid((0:wdth:3*wdth)+0.5);
plot(X,Y,'b',Y,X,'b','LineWidth',2)%����ͼ
hold off
%����ı�
text(1.45*wdth,1.45*wdth,'$p$','Interpreter','latex','FontSize',wdth,'Color','r')

B = M([8 7 4 1 2 3 6 9 8]);     % % ����ಹ��һλ
Q = 1 - B;
Nc4p = 0;
Nc8p = 0;
for k = 1:2:7
    Nc4p = Nc4p + B(k) - prod(B(k:k+2));
    Nc8p = Nc8p + Q(k) - prod(Q(k:k+2));
end
%����ı�
text(3.25*wdth,1*wdth,['$N_c^{(4)}(p) $',' = ',num2str(Nc4p)],'Interpreter','latex','FontSize',0.8*wdth,'Color','r')
text(3.25*wdth,2*wdth,['$N_c^{(8)}(p) $',' = ',num2str(Nc8p)],'Interpreter','latex','FontSize',0.8*wdth,'Color','r')
