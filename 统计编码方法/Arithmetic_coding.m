function code = Arithmetic_coding(p,s)
% Arithmetic_coding
% 算术编码编码

qq = [0,cumsum(p)];
% 计算前缀和
q = qq;
% 计算数组 存储子区间压缩码

for i = 1 :length(s)-1
    q = (q(s(i)+1)-q(s(i)))*qq + q(s(i)); 
    % 根据子区间长度 递推计算
end

code = q(s(end));
% 得到压缩码编码

end