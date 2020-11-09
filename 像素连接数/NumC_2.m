function NumC
% Number of Connections
% ���캯��Numc 
% ��������������������
clc
clear
close all
tic
digit = 2^8;               % Ԥ�洢 256 ,���ټ���
B = zeros(digit,8);        % ��ʼ�� B ����
cbs = dec2bin(0:digit-1);  % ��0-255��ֵת�������ַ���

for k = 1:digit                      % ö��cbs�е�������
    for t = 1:8                      % �Զ���������ÿһλ���б������洢������B��
        B(k,t) = str2double(cbs(k,t)); 
    end
end

D = [B(:,1:4), ones(digit,1), B(:,5:8)]; 
% ����һ���µľ��� D ���� 0 ~ 255 �����ж�����������λ��һλ1 ����3*3�����е������Ѵ���

B=[1 4 7;2 5 8;3 6 9];
Bz=B';
% Ԥ����B������B��ת�þ��� 

P6 = [reshape(Bz,1,[]); fliplr(reshape(Bz,1,[])); reshape(fliplr(B),1,[]); reshape(flipud(B),1,[]);
    reshape(rot90(B),1,[]); reshape(rot90(B,2),1,[]); reshape(rot90(B,3),1,[])];    
% ��B�����7��ͬ�������壨ˮƽ����ֱ��ת�������Խ��߷�ת����ת90��1-2-3�Σ�ȫ���洢��P6������
% ��Ԥ��ָ��ÿ��ö��ÿһ����������ʱ��ÿһλ��ת�Ƶ�λ��

Q = zeros(7,9); % ��ʼ��Q����

M = D(1,:);    
M = [M ; D(digit,:)];
% �洢�����M���󣬲�Ԥ�洢ȫΪ0��1�����

for k = 2:digit-1   
    p = D(k,:);                     % ö��2-255���������
    for s = 1:7
        Q(s,:) = p(P6(s,:));        % ���� Q ���󣬼� ��ǰ������������P6�ֵ���й������������
    end
    if ~sum(ismember(Q,M, 'rows'))  % ȷ�Ϲ���� Q �����Ƿ��� �𰸾���M�д���
        M = [M;p];
    end
end
toc

for k =1:size(M,1)                 
    drawsquare3(reshape(M(k,:),3,[]));      % ���ƴ�
    pause(0.1);                             % ��ͣ 0.1 ��
    saveas(gcf,['Nc',num2str(k),'.png']);   % ��png��ʽ������ƽ��
    pause(0.1);
end
close all   % ���ƽ�����رմ���


function drawsquare3(M)
% ���ƺ��� drawsquare3 
% M Ϊ��ǰ���ƵĹ������
wdth = 30; % wdth Ϊÿ��1*1���εı߳�
N = zeros(3*wdth,3*wdth);
% ����ָ���߳���ʼ��ͼ�����
for p = 1 : 3
    for q = 1 : 3
        N((p-1)*wdth+1:p*wdth,(q-1)*wdth+1:q*wdth) = 0.5*(1-M(p,q))+0.25;
        % ��((p-1)*wdth+1,(q-1)*wdth+1) , (p*wdth,q*wdth) �������������
        % ��ָ��λ��Ϊ1ʱ�����Ҷ�Ϊ0.25;��ָ��λ��Ϊ0ʱ�����Ҷ�Ϊ0.75
    end
end

subplot(1,3,[1,2]);
imshow(N); % ���ƴ�ͼ��
hold on
[X,Y] = meshgrid((0:wdth:3*wdth)+0.5);     % ���ɸ�������
plot(X,Y,'b',Y,X,'b','LineWidth',2);       % ���Ƹ������� �߿�=2 ��ɫΪ��ɫ 
hold off

text(1.45*wdth,1.45*wdth,'$p$','Interpreter','latex','FontSize',wdth,'Color','r');
% ��3*3�е� ������ĸp ��ȷ�Ͼ����е� 

B = M([8 7 4 1 2 3 6 9 8]);     
% ͨ���±�ȷ�϶����ƴ�
Q = 1 - B;
% ���� B ��λȡ��

Nc4p = 0;
Nc8p = 0;
for k = 1:2:7
    Nc4p = Nc4p + B(k) - prod(B(k:k+2));
    Nc8p = Nc8p + Q(k) - prod(Q(k:k+2));
end
% �����������������������

text(3.25*wdth,1*wdth,['$N_c^{(4)}(p) $',' = ',num2str(Nc4p)],'Interpreter','latex','FontSize',0.8*wdth,'Color','r');
text(3.25*wdth,2*wdth,['$N_c^{(8)}(p) $',' = ',num2str(Nc8p)],'Interpreter','latex','FontSize',0.8*wdth,'Color','r');
% ��ʾ�������������������