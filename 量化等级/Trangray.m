function OutImg = Trangray(InImg,jx)
%TRANGRAY �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
dfactor=uint16(2^(jx+1));
OutImg=uint16(InImg);
OutImg=floor(OutImg/dfactor)*dfactor;    
OutImg=uint8(OutImg);
end

