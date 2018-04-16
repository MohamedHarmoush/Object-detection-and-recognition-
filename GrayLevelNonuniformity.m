function GLNU = GrayLevelNonuniformity(RLM,Nr)
[rows,cols]=size(RLM);
GLNU = 0;

for i=1:rows
    x = 0;
    for j=1:cols
        x = x + RLM(i,j);
    end
    x = x^2;
    
    GLNU = GLNU + x;
end
GLNU = GLNU/ Nr;
end