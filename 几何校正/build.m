function model = build(x,y)
%BUILD Ω®¡¢æÿ’Û

model=ones(4,4);

for i = 1:3
    for j = 1:4
        if i == 1 
            model(j,i)=x(j)*y(j);
        elseif i == 2
            model(j,i)=x(j);
        elseif i == 3
            model(j,i)=y(j);
        end
    end
end

end
    
    