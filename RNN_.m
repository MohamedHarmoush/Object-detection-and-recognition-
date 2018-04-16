%% Reading Test Features Table & Train Features Table
% Reading Training Table 25 * 15 + label column
Training = xlsread('TrainingRunLengthFeatures.xlsx');
%Training = xlsread('TraininglcmFeatures.xlsx');
%Training = xlsread('TrainingFeatures.xlsx');

Testing = xlsread('TestingRunLengthFeatures.xlsx');
%Testing = xlsread('TestinglcmFeatures.xlsx');
%Testing = xlsread('TestingFeatures.xlsx');
[TestH,TestW] = size(Testing);
[TrainH,TrainW] =size(Training);
%% Scaling Data
% Max_Values_Training = max(Training);
% % Normalizing Training Data
% for i=1:TrainW-1
%     for j=1:TrainH
%         Training(j,i) = double(Training(j,i) / Max_Values_Training(i));
%     end
% end
% % Normalizing Testing Data
% Max_Values_Testing = max(Testing);
% for i=1:TestW-1
%     for j=1:TestH
%         Testing(j,i) = double(Testing(j,i) / Max_Values_Testing(i));
%     end
% end

%% Constructing Distance Sorted Table 25 * 26
% Distance_Table That holds The distance between every pic in test and the
% other pictures in trianing.
Distance_Table = zeros([25,26]);
% crawling column 
for i=1:TestH
    % crawling Rows
    for j=1:TrainH
        %crawling on 15 features in test and training
        Temp_sum = 0;
        for k=1:TrainW-1
            Temp_sum = Temp_sum + ((Testing(i,k) - Training(j,k))^2);
        end
        Distance_Table(j,i) = sqrt(Temp_sum); % Getting The Euclidean distance between Test(i,:) & Training(j,:)
    end
end
% sorting Distance_Table 
[Sorted_Distance_Table, Indexes] = sort(Distance_Table);
Normalized_Sorted_DistanceTable = zeros([25 26]);

% %% Normalizing Distance Table
% for i=1:25
%     for j=1:26
%         Normalized_Sorted_DistanceTable(i,j) = double(Sorted_Distance_Table(i,j)) / Sorted_Distance_Table(25,j);
%     end
% end

%% getting neighbors In R where from 0.1 To 0.8
Accuracy_Mat = zeros([130,2]);
Accuracy_ind = 1;
%%%%crawling Indexes and filling in Confusion matrix%%%%
for R=1:1:130
% constructing confusion matrix
Confusion_Mat = zeros([5,5]);

Vector = zeros([1,5]);
% crawling Columns 
for i=1:26 %Tests
    % crawling Rows
    for j=1:25 
        if Sorted_Distance_Table(j, i) < R
            Vector(1, Training(Indexes(j,i) ,TestW)) = Vector(1, Training(Indexes(j,i) ,TestW)) + 1;
        end
    end
    % sorting Vector 
    [Sorted_Vec, Vec_Indexes] =  sort(Vector,'descend');
    % Check If Vector have one max value
    if(Vector(1,1) ~= Vector(1,2)) 
        Confusion_Mat(Vec_Indexes(1,1), Testing(i,TestW)) = Confusion_Mat(Vec_Indexes(1,1), Testing(i,TestW)) + 1;
    else % max value is repeated 
        Confusion_Mat(Training(Indexes(j, 1) ,TrainW), Testing(i,TestW)) = Confusion_Mat(Training(Indexes(j, 1) ,TrainW), Testing(i,TestW)) + 1;
    end
end
% adding result of R to Accuracy_Mat
if R== 110
    display(Confusion_Mat);
end
Accuracy_Mat(Accuracy_ind, 1) = R;
Accuracy_Mat(Accuracy_ind, 2) = ceil(sum(diag(Confusion_Mat)) / (sum(sum(Confusion_Mat)))*100);
Accuracy_ind = Accuracy_ind + 1;
end

% Error Rate Matrix
%Error_Mat = 100 - Accuracy_Mat(:,2);


plot(Accuracy_Mat(:,1), Accuracy_Mat(:,2));