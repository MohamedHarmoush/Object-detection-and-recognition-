%input_directory ='D:\FCIS\Year 4 [CS]\CS\pattern recognition\Labs\Lab8 - Final Project\Data set\Training';
input_directory ='D:\FCIS\Year 4 [CS]\CS\pattern recognition\Labs\Lab8 - Final Project\Data set\Testing\segmented';
filenames = dir(fullfile(input_directory, '*.jpg'));
num_images = length(filenames);
RunLengthfeatures = [];
glcmfeatures = [];
Features = [];
%RunLengthfeatures = zeros(num_images,11);
for i=1:num_images
    filename = fullfile(input_directory, filenames(i).name);
    img = imread(filename);  
    imshow(img);
    img = rgb2gray(img);
    [h,w] = size(img);
    current_max = max(img(:));
    current_min = min(img(:));
    img = uint8(((img-current_min)*5)/(current_max-current_min));
    img = img + 1;

    name = split(filenames(i).name,{' - ','.jpg'});
    classLable = 0;
    if strcmpi(name(2,1),'Cat') == 1
        classLable = 1;
    elseif strcmpi(name(2,1),'Laptop') == 1
        classLable = 2;
    elseif strcmpi(name(2,1),'Apple') == 1
        classLable = 3;
    elseif strcmpi(name(2,1),'Car') == 1
        classLable = 4;
    elseif strcmpi(name(2,1),'Helicopter') == 1
        classLable = 5;
    end
    features1 = glcmFeatures(img);
    features2= RunLengthMatrix(img);
  %  imshow(Gimg);
    glcmfeatures = [glcmfeatures;features1,classLable];
    RunLengthfeatures = [RunLengthfeatures;features2,classLable];
    Features = [Features;features1,features2,classLable];
end
sheet = 1;
xlswrite('TestinglcmFeatures.xlsx',glcmfeatures,sheet);
xlswrite('TestingRunLengthFeatures.xlsx',RunLengthfeatures,sheet);
xlswrite('TestingFeatures.xlsx',Features,sheet);