function [Filer_img,Filers_img] = Butterworth_Highpass(gray_img,d0,n)
%BUTTERWORTH_HIGHPASS Butterworth��ͨ�˲���
%  H(u,v)=1/(1+(D(u,v)/D0)^(2*n))

[r,c]=size(gray_img);
R=r*2;
C=r*2;

Filer_t_img=zeros(R,C);
% ��ͼ�����0��䣬�õ���СΪP*Q��ͼ����Ҫ��Ϊ�˱�����ѭ������г��ֵĲ��ƴ���
% �����������С��ͬʱ��P��2m-1��Q��2n-1ʱ���Ա��⻷�ƴ���
% ���ڶ���ż���ߴ�ľ�������丵��Ҷ�任�Ͽ죬���Pȡ2m��Qȡ2n��

for i = 1:r
    for j = 1:c
        Filer_t_img(i,j) = double(gray_img(i,j)) * (-1)^(i+j);
    end
end
% ͼ�����(-1)^(x+y)���ٶ�ͼ����и���Ҷ�任���Եõ���ԭ���Ƶ����ĵĸ���Ҷ�任��
% ����������F(u,v)��˵�����ĵ�Ƶ����ͣ����ܵ�Ƶ�ʽϸߡ�
% ÿһ���ֵ��ʾ��Ƶ�ʶ��ڵķ��ȡ�
% ��matlab�У�Ҳ���Բ�����(-1)^(x+y)��ֱ�Ӷ������ͼ����и���Ҷ�任��
% ֮��ʹ��fftshift�������丵��Ҷ�任�������Ļ����õ��Ľ����һ���ġ�

Filer_t_img = fft2(Filer_t_img); % ���ٸ���Ҷ�任
h=zeros(R,C);
d02n=d0^(2*n); % Ԥ����
for i = 1:R
    for j = 1:C
        D=(i-(r+1))^2+(j-(c+1))^2;
        h(i,j)=1/(1+(D^n)/d02n);
    end
end
% �����˲���������ʱͼ�����ĵ�Ϊ(r+1,c+1)

Filer_t_img = Filer_t_img .* h; % �����˲�
Filers_img = Filer_t_img; % �õ���Ƶ���Ѿ������Ļ�����

Filer_t_img = real(ifft2(Filer_t_img)); % ��fft ��Ƶ��ת��Ϊͼ����
Filer_img=zeros(r,c);

for i = 1:r
    for j = 1:c
        Filer_img(i,j) = Filer_t_img(i,j)*(-1)^(i+j);
    end
end

% ��fft ��Ƶ��ת��Ϊͼ����

end

