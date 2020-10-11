function OutImg = Trangray(InImg,jx)
%TRANGRAY 此处显示有关此函数的摘要
%   此处显示详细说明
dfactor=uint16(2^(jx+1));
OutImg=uint16(InImg);
OutImg=floor(OutImg/dfactor)*dfactor;    
OutImg=uint8(OutImg);
end

