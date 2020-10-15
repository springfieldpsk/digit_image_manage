function out_img=median_filtering(inputimg)
%median_filtering 中值滤波法实现图像空间域平滑

img=inputimg;
[r,c]=size(img);
img=double(img);
out_img=zeros(r,c);

for i = 1:r-2
    for j = 1:c-2
        mask=img(i:i+2,j:j+2);
        ans =sort(mask(:));
        out_img(i+1,j+1)=ans(5);
    end
end
out_img=out_img/255;

end

