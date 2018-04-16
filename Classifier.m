function output = Classifier(features,ClassificationAlgo)
[~,W]=size(features);
if W == 4
    Training = xlsread('TraininglcmFeatures.xlsx');
elseif W == 11
    Training = xlsread('TrainingRunLengthFeatures.xlsx');
else 
    Training = xlsread('TrainingFeatures.xlsx');
    %Training = xlsread('TrainFeatures.xlsx');
end
% %% Scaling Data
% Max_Values_Training = max(Training);
% % Normalizing Training Data
% for i=1:W
%     for j=1:25
%         Training(j,i) = double(Training(j,i) / Max_Values_Training(i));
%     end
%     %features(1,i) = double(features(1,i)/Max_Values_Training(i));
% end
%%
if ClassificationAlgo == 1
    output = ModifiedKNN(features,Training);
elseif ClassificationAlgo == 2
    output = RNearNeighbors(features,Training);
elseif ClassificationAlgo == 3
    output = SupportVectorMachine_(features,Training);
end  
end