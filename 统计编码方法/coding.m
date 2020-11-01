
clc
clear 
close all

tic

p =[0.4 0.3 0.15 0.05 0.06 0.04]; % 概率数组
[ b, h , e, code] = Huffman_code(p);
disp('概率数组为：');
disp(p);
fprintf('平均码长为: %.4f\n', b);
fprintf('信源熵为: %.4f\n', h);
fprintf('编码效率为: %.4f\n', e);
disp('Huffman编码结果为：')
n=length(p);

disp('----概率----|----编码----');
disp('-------------------------');
for i = 1:n
    fprintf("%10f  | %10s\n", p(i),code{i});
end
% 输出结构

p = [0.1 0.3 0.2 0.4]; % 概率数组
s = [4 4 3 1 2]; % 字符顺序
code = Arithmetic_coding(p,s);

disp('概率数组为：');
disp(p);
disp('字符顺序为：');
disp(s);
disp('算术编码结果为:');
disp(code);
dec=Arithmetic_decoding(p,code);
disp('上式解码结果为:');
disp(dec);
toc

