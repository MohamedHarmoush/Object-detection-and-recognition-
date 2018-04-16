function SRE = shortRunEmphasisORLong(RLM,Nr,short)
[rows,cols]=size(RLM);
SRE = 0;
%  if short 1 shortRunEmphasis
for i=1:rows
    for j=1:cols
        x=0;
        if(short == 1)
           x = RLM(i,j)/(j^2);
        else
            x = RLM(i,j)*(j^2);
        end
        SRE = SRE+ x;
    end
end
SRE = SRE/Nr;
end