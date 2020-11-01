function mesg = Arithmetic_decoding(p, code)
% Arithmetic_decoding
% 算术编码解码

qq = [0,cumsum(p)];
% 计算前缀和

mesg = [];
% 初始化

while abs(code) > sqrt(eps) % 反复迭代逼近eps

    nowc = code + sqrt(eps); % 确定当前code值
    % for i = 1 : length(qq) -1 % 搜索当前区间
    %     if (nowc >= qq(i)) && (nowc < qq(i+1))  % 确定当前所在区间
    %         mesg = [mesg i];
    %         code = (qq(i+1)-qq(i))\(code-qq(i)); 
    %         % 反推编码
    %         break ; % 搜索结束 退出循环
    %     end
    % end
    % 由于具有单调性 因此此处搜索可以用二分优化
    l = 1 ;
    r = length(qq) -1;
    
    while l < r 
        mid = bitshift(l+r, -1);
        if (nowc >= qq(mid)) 
            r = mid - 1;
            p = mid;
        else
            l = mid + 1;
        end
    end 

    mesg = [mesg p];
    code = (qq(p+1)-qq(p))\(code-qq(p)); 
end

end

