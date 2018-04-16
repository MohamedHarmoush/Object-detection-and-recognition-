NewImage = imread('D:\FCIS\Year 4 [CS]\CS\pattern recognition\Labs\Lab8 - Final Project\Data set\Testing\T2 - Cat Laptop.png');
[W,H]=size(NewImage);
img = imread('D:\FCIS\Year 4 [CS]\CS\pattern recognition\Labs\Lab8 - Final Project\Data set\Testing\T2 - Cat Laptop.jpg');
BW =rgb2gray(NewImage);
imhist(BW);
%BW =rgb2gray(NewImage);
%BW = imbinarize(BW);
[Labels,no_objects] = bwlabel(BW); %Integer labels starting from 0
%stats = regionprops(Labels,'BoundingBox');
cc = bwconncomp(Labels);
%mkdir Testing
cd Testing
for i=1:cc.NumObjects
    n = cc.PixelIdxList{1,i};
    [N , ~] = size(n);
    dfsminx=100000000;
    dfsminy=100000000;
    dfsmaxx=0;
    dfsmaxy=0;
    for j=1:N
        idx = n(j);
        [row , col] = ind2sub([W,H],idx);
      
       dfsminx=min(dfsminx,row);
       dfsminy=min(dfsminy,col);
       dfsmaxx=max(dfsmaxx,row);
       dfsmaxy=max(dfsmaxy,col);       
    end
    
    tmp = imcrop(img,[dfsminy-1 dfsminx-1 dfsmaxy-dfsminy+2 dfsmaxx-dfsminx+2]);
    tmp = imresize(tmp , [100 100]);
    name =int2str(i);
    name = strcat(name , '.jpg');
    imwrite(tmp,name);
end