function output = ObjectDetectioAndRecognition(orignialImage,segImage,featuresExtractionAlgo,ClassificationAlgo,h)
%image = preprocessing(image); %preprocessing
[imageObjectsfilenames,objectsBoundry] = segmentation(orignialImage,segImage);
%waitbar(20/100,h);

[H,~] = size(imageObjectsfilenames);
        for i=1:H 
        %if (i==2 || i == 4)
        image = imread(imageObjectsfilenames(i,:));
        imshow(image);
        features = featureExtraction(image,featuresExtractionAlgo);
        c = Classifier(features,ClassificationAlgo);
        bb = objectsBoundry(i,:);
        orignialImage = insertShape(orignialImage,'rectangle',bb,'LineWidth',3);
        if  c == 1
            classLable ='Cat';
        elseif c == 2
            classLable ='Laptop';
        elseif c == 3
            classLable = 'Apple';
        elseif c == 4
            classLable = 'Car';
        elseif c == 5
            classLable = 'Helicopter';
        end
        orignialImage = insertText(orignialImage,[bb(1,1),bb(1,2)],classLable,'FontSize',18,'BoxColor','red','BoxOpacity',0.4,'TextColor','white');
        %imshow(orignialImage),rectangle('Position',[bb(1,1) bb(1,2) bb(1,3) bb(1,4)],'EdgeColor','green','LineWidth',4);
       % output = c;
       % imshow(orignialImage);
        %end
       % waitbar(20+(i*2)/100,h);
        end
    output = orignialImage;
 
  %  imshow(orignialImage);
end