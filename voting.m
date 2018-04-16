function class = voting( classList )
lables = [0 0 0 0 0];
for i = 1:10
    lables(classList(i)) = lables(classList(i))+1;
end
class = max(lables);
end

