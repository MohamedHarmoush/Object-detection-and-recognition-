function [ class ] = getClass( c , training )
class = [];
[m,n]=size(training);
for i = 1:m
    if(training(i,n)== c)
        class = [class ; training(i,1:n-1)];
    end
end
end

