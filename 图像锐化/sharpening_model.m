function out_img=sharpening_model(varargin)
%SHARPENING_MODEL 此处显示有关此函数的摘要
%   此处显示详细说明

narginchk(2,3);
level=255;
input_img=double(varargin{1});

if nargin == 3
    model_x=varargin{2};
    model_y=varargin{3};
    out_img_x=abs(conv2(input_img,model_x,'same'));
    out_img_y=abs(conv2(input_img,model_y,'same'));
    out_img=out_img_x*0.5+out_img_y*0.5;
else 
    model=varargin{2};
    out_img=abs(conv2(input_img,model,'same'));
end
out_img=out_img/level;
end

