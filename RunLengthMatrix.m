function RLMfeatures = RunLengthMatrix(img)
MaxIntensity = 4;
SRE=0;
LRE=0;
LGRE=0;
HGRE=0;
SRLGE=0;
SRHGE=0;
LRLGE=0;
LRHGE=0;
GLNU=0;
RLNU=0;
RPC=0;
for direction=0:45:135
 RLM = countNumOfOCurrance(direction,img,MaxIntensity);
 [Nr,Np] = SumofRunsAndSumofPixels(RLM);
SRE = SRE + shortRunEmphasisORLong(RLM,Nr,1);
LRE = LRE + shortRunEmphasisORLong(RLM,Nr,0);
LGRE = LGRE + LowGrayLevelRunEmphasisOrHigh(RLM,Nr,1);
HGRE = HGRE + LowGrayLevelRunEmphasisOrHigh(RLM,Nr,1);
SRLGE = SRLGE + shortRunLowGrayLevelEmphasisOrHigh(RLM,Nr,1,1);
SRHGE = SRHGE + shortRunLowGrayLevelEmphasisOrHigh(RLM,Nr,1,0);
LRLGE = LRLGE + shortRunLowGrayLevelEmphasisOrHigh(RLM,Nr,1,1);
LRHGE = LRHGE + shortRunLowGrayLevelEmphasisOrHigh(RLM,Nr,1,0);
GLNU = GLNU + GrayLevelNonuniformity(RLM,Nr);
RLNU = RLNU + RunLengthNonuniformity(RLM,Nr);
RPC = RPC + RunPercentage(Nr,Np);
% SRE = shortRunEmphasisORLong(RLM,Nr,1);
% LRE =  shortRunEmphasisORLong(RLM,Nr,0);
% LGRE = LowGrayLevelRunEmphasisOrHigh(RLM,Nr,1);
% HGRE =  LowGrayLevelRunEmphasisOrHigh(RLM,Nr,0);
% SRLGE =  shortRunLowGrayLevelEmphasisOrHigh(RLM,Nr,1,1);
% SRHGE =  shortRunLowGrayLevelEmphasisOrHigh(RLM,Nr,1,0);
% LRLGE =  shortRunLowGrayLevelEmphasisOrHigh(RLM,Nr,0,1);
% LRHGE = shortRunLowGrayLevelEmphasisOrHigh(RLM,Nr,0,0);
% GLNU = GrayLevelNonuniformity(RLM,Nr);
% RLNU =  RunLengthNonuniformity(RLM,Nr);
% RPC = RunPercentage(Nr,Np);
% display(direction);
% display(SRE);
% display(LRE);
% display(LGRE);
% display(HGRE);
% display(SRLGE);
% display(SRHGE);
% display(LRLGE);
% display(LRHGE);
% display(GLNU);
% display(RLNU);
% display(RPC);
% display(RLM);
end
RLMfeatures=[SRE/4,LRE/4,LGRE/4,HGRE/4,SRLGE/4,SRHGE/4,LRLGE/4,LRHGE/4,GLNU/4,RLNU/4,RPC/4];
%display(RLMfeatures);
end