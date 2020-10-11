function Local_smoothing(inputArg)
%LOCAL_SMOOTHING 局部平滑法实现图像空间域平滑
narginchk(1,3);
img_in=inputArg{1}; % 输入图像
threshold=0; % 阈值
model=[1,1,1;1,1,1;1,1,1]; % 模板

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

