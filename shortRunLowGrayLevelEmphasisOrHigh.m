function SRLGE = shortRunLowGrayLevelEmphasisOrHigh(RLM,Nr,short,low)
SRLGE =0;
[rows,cols]=size(RLM);
for i=1:rows
    for j=1:cols
        x=0;
        if(low == 1)
           x = RLM(i,j)/(i^2);
        else
            x = RLM(i,j)*(i^2);
        end
        if(short == 1)
            x = x/(j^2);
        else
            x = x *(j^2);
        end
        SRLGE = SRLGE+ x;
    end
end
SRLGE = SRLGE/Nr;
end