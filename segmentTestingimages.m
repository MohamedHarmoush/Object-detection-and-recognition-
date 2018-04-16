input_directory ='D:\FCIS\Year 4 [CS]\CS\pattern recognition\Labs\Lab8 - Final Project\Data set\Testing';
%Testingfolder = 'D:\FCIS\Year 4 [CS]\CS\pattern recognition\Labs\Lab8 - Final Project\Testing';
jpgImages = dir(fullfile(input_directory, '*.jpg'));
pngImages = dir(fullfile(input_directory, '*.png'));
num_images = length(jpgImages);
for indx=1:num_images
    filename = fullfile(input_directory, jpgImages(indx).name);
    orignialImage = imread(filename);
    filename = fullfile(input_directory, pngImages(indx).name);
    image = imread(filename);
    [H,W]=size(orignialImage);
    grayimage = rgb2gray(image);
    
    imshow(grayimage);
    BW = edge(grayimage,'canny');
    BW = imdilate(BW,ones(5,5));
    BW = ~BW;
    imshow(BW);
    [Labels,no_objects] = bwlabel(BW);
    segmentedimage = label2rgb(Labels);
    imshow(segmentedimage);
    %smallRatio = H*W*0.0002;

    background = 1;
    largest =0;
    [a,b]=size(Labels);
    c1 = Labels(1,1);
    c2 = Labels(1,b);
    c3 = Labels(a,1);
    c4 = Labels(a,b);
    smallRatio = a*b*0.002;
   % cd Testing;
    for i=1:no_objects
        x = uint8(Labels==i);
        f = sum(sum(x==1));
        if (largest < f && (i == c1 || i == c2 || i == c3 || i== c3))
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
        d = zeros(size(image));
        d(:,:,1) = uint8(x).*segmentedimage(:,:,1);
        d(:,:,2) = uint8(x).*segmentedimage(:,:,2);
        d(:,:,3) = uint8(x).*segmentedimage(:,:,3);
        imshow(d);
        imgray = rgb2gray(d);
        props = regionprops(imgray, 'BoundingBox');
        %props = regionprops(imgray, 'Extrema');
        % Crop the image
        croppedImage = imcrop(orignialImage, props.BoundingBox);
        %croppedImage = imcrop(orignialImage, props.Extrema);
        cd 'D:\FCIS\Year 4 [CS]\CS\pattern recognition\Labs\Lab8 - Final Project\Data set\Testing\segmented';
        imshow(croppedImage);
        if i == background
            continue;
        end
        name =int2str(i);
        n = split(pngImages(indx).name,'.png');
        name = strcat(n,name);
        filename = sprintf('%s.jpg',name(1));
        imwrite(croppedImage, filename);
        
    end
end