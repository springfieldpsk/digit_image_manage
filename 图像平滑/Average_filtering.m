function out_img=Average_filtering(inputimg)
%median_filtering 均值滤波法实现图像空间域平滑

img=inputimg;
[r,c]=size(img);
img=double(img);
out_img=zeros(r,c);

for i = 1:r-2
    for j = 1:c-2
        mask=img(i:i+2,j:j+2);
        tot =sum(mask(:))/9;
        out_img(i+1,j+1)=tot;
    end
end
out_img=out_img/255;

end

