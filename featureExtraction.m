function features = featureExtraction(image,featuresExtractionAlgo)
%featuresExtractionAlgo =1 if GLCM , featuresExtractionAlgo = 2 if  run
%length and featuresExtractionAlgo = 0 GLCM + Run-Length Matrix length
image = rgb2gray(image);
[h,w] = size(image);
% for	y=1:h
%     for x=1:w
%         image(y,x) = mod(image(y,x),6);
%     end
% end
%scale values from 0 to 5
current_max = max(image(:));
current_min = min(image(:));
image = uint8(((image-current_min)*5)/(current_max-current_min));
image = image + 1;

if featuresExtractionAlgo == 1
    features = glcmFeatures(image);
elseif featuresExtractionAlgo == 2
    features = RunLengthMatrix(image);  
elseif featuresExtractionAlgo == 3
    GLCMfeatures = glcmFeatures(image);
    RunLengthMatrixfeatures = RunLengthMatrix(image);
    features = [GLCMfeatures RunLengthMatrixfeatures];
end     
end