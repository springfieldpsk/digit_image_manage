function Local_smoothing(inputArg)
%LOCAL_SMOOTHING �ֲ�ƽ����ʵ��ͼ��ռ���ƽ��
narginchk(1,3);
img_in=inputArg{1}; % ����ͼ��
threshold=0; % ��ֵ
model=[1,1,1;1,1,1;1,1,1]; % ģ��

if nargin >= 2
    model= inputArg{2};
end
if nargin == 3
    threshold=input{3};
end

[n,m]=size(img_in);
[x,y]=size(model);
g=zeros(n,m);
M=sum(model,'all');

end

