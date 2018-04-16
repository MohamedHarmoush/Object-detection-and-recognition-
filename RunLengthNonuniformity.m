function RLNU =RunLengthNonuniformity(RLM,Nr)
[rows,cols]=size(RLM);
RLNU = 0;

for j=1:cols
    x = 0;
    for i=1:rows
        x = x + RLM(i,j);
    end
    x = x^2;
    
    RLNU = RLNU + x;
end
RLNU = RLNU/ Nr;
end