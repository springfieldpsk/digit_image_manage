function Skeletondistance
% % Skeleton by Distance
clc
clear

Img = rgb2gray(imread('../lena.tiff'));

subplot(121)
imshow(Img)

ImgO = Img<125;                         % ���Ҷ�ͼ��ת��Ϊ��ֵͼ��,�ѻҶ�ֵС��125�ĸ�ֵΪ0�����ڵ���125�ĸ�ֵΪ1
[m,n] = size(ImgO);                     % m,nΪԭʼͼ��Ĵ�С

ImgB = padarray(ImgO,[1,1],'replicate');    % ���ų�m+2��n+2�����������Ҹ���������/��

G = 255*ImgB;   %%�Ҷ�ֵ��[0,255]֮��
Flag = 1;  %%����ѭ������
while Flag
    Q = zeros(size(G));
    for p = 2 : m+1
        for q = 2 : n+1
            if ImgB(p-1,q-1)
                Q(p,q) = min([G(p,q),G(p-1,q)+1,G(p+1,q)+1,G(p,q-1)+1,G(p,q+1)+1]);  % ����任��ʽ
            end
        end
    end
    if norm(Q-G)<eps   % ��ͼ��Q-G��ֵ��������ʱ��flag��Ϊ0����ͼ�����ٱ仯ʱ��ֹͣѭ��
        Flag = 0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    end
    G = Q;  % ���Ͻ��о���任��ֵ
end
subplot(122)
imshow(G,[])

