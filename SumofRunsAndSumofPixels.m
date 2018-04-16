function [Nr,Np] = SumofRunsAndSumofPixels(RLM)
[rows,cols]=size(RLM);
Nr = 0;
Np = 0;
for i=1:rows
    for j=1:cols
        Nr = Nr+RLM(i,j);
        Np = Np+(RLM(i,j)*j);
    end
end
end