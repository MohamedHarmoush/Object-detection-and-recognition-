function LGRE = LowGrayLevelRunEmphasisOrHigh(RLM,Nr,low)
LGRE =0;
[rows,cols]=size(RLM);
for i=1:rows
    for j=1:cols
        x=0;
        if(low == 1)
           x = RLM(i,j)/(i^2);
        else
            x = RLM(i,j)*(i^2);
        end
        LGRE = LGRE+ x;
    end
end
LGRE = LGRE/Nr;
end