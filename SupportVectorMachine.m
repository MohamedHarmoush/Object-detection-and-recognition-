function  classes  = SupportVectorMachine( testing , training )
classes = [];
%vector of classifiers
classifiers = [];
%train 10 binary classifiers
for i = 1:4
    for j = i+1:5
        svmStruct = trainTwo(i,j,training);
        classifiers = [classifiers svmStruct];
    end
end
%list of predicted classes
predictedClasses = [];
%classify each test case
[h,w] = size(testing);
for i = 1:h
    testingData = testing(i,:);
    for j = 1:10
        svmClass = svmclassify(classifiers(j),testingData);
        predictedClasses = [predictedClasses ; svmClass];
    end
    maxClass = voting(predictedClasses);
    classes = [classes ; maxClass];
    predictedClasses = [];
end
end

