function [ b, h,e, code] = Huffman(p)
% Huffmancode
% 通过位置矩阵生成霍夫曼编码
% b=平均码长 h=信源熵 e=编码效率 code=霍夫曼编码结果

n = length(p) ;
h=sum(-p.*log2(p));

w=[;];
% 位置矩阵，记录数据的变化过程

tmp = p ;
% 临时概率数组

for i=1:n
    [tmp,l]=sort(tmp);
    w(i,:)=[l(1:n-i+1),zeros(1,i-1)];
    tmp=[tmp(1)+tmp(2),tmp(3:n),1];
end

a={;};
% 字符数组，存储霍夫曼码

for i=1:2*n
    for j=1:n
        a{i,j}=' ';
    end
end
% 初始化字符数组

a{2*n,1}=''; 

for i=0:n-1
    for j=1:i+1
        a{2*(n-i)-1,j}=a{2*(n-i),find(w(n-i,:)==j)}; % 根据变换矩阵映射
    end
    if(i == n-1) % 当 i == n-1 时，不需要赋新值
        break;
    end
    a{2*(n-i-1),1}=strcat(a{2*(n-i)-1,1},'1'); % 概率小值赋值为1
    a{2*(n-i-1),2}=strcat(a{2*(n-i)-1,1},'0'); % 概率大值赋值为0
    for j=3:i+2
        a{2*(n-i-1),j}=a{2*(n-i)-1,j-1};
    end
end  


for i=1:n
    len(i)=length(a{1,i});
    code(i)=a(1,i);
end

b=sum(len.*p);
e=h/b;



end    