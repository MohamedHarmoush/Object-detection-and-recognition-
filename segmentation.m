function [imageObjectsfilenames,objectBoundry] = segmentation(orignialImage,segImage)
    imageObjectsfilenames =[];
    objectBoundry = [];
    grayimage = rgb2gray(segImage);
    %imshow(grayimage);
    BW = edge(grayimage,'canny');
    BW = imdilate(BW,ones(5,5));
    BW = ~BW;
   % imshow(BW);
    [Labels,no_objects] = bwlabel(BW);
    segmentedimage = label2rgb(Labels);
    %imshow(segmentedimage);
    %smallRatio = H*W*0.0002;

    background = 1;
    largest =0;
    [a,b]=size(Labels);
    c1 = Labels(1,1);
    c2 = Labels(1,b);
    c3 = Labels(a,1);
    c4 = Labels(a,b);
    smallRatio = a*b*0.0002;
    for i=1:no_objects
        x = uint8(Labels==i);
        f = sum(sum(x==1));
        if (largest < f && (i == c1 || i == c2 || i == c3 || i== c3|| i== c4))
            largest = f;
            background = i;
        end
    end
    for i=1:no_objects
        x = uint8(Labels==i);
        f = sum(sum(x==1));
        if(f < smallRatio) % to neglect small regions
             continue;
        end
        if i == background
            continue;
        end
        d = zeros(size(segImage));
        d(:,:,1) = uint8(x).*segmentedimage(:,:,1);
        d(:,:,2) = uint8(x).*segmentedimage(:,:,2);
        d(:,:,3) = uint8(x).*segmentedimage(:,:,3);
        imgray = rgb2gray(d);
        props = regionprops(imgray, 'BoundingBox');
        croppedImage = imcrop(orignialImage, props.BoundingBox);
        objectBoundry =[objectBoundry;props.BoundingBox];
        %cd 'D:\FCIS\Year 4 [CS]\CS\pattern recognition\Labs\Lab8 - Final Project';
%        imshow(croppedImage);
        name =int2str(i);
        imgename = string(orignialImage(1));
        n = split(imgename,'.png');
        name = strcat(n,name);
        filename = sprintf('%s.jpg',name(1));
        imageObjectsfilenames =[imageObjectsfilenames;filename];
        imwrite(croppedImage, filename);
        
    end
end