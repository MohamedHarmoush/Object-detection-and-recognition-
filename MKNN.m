%% Reading Test Features Table & Train Features Table
% Reading Training Table 25 * 15 + label column
%Training = xlsread('TrainingRunLengthFeatures.xlsx');
%Training = xlsread('TraininglcmFeatures.xlsx');
Training = xlsread('TrainingFeatures.xlsx');

%Testing = xlsread('TestingRunLengthFeatures.xlsx');
%Testing = xlsread('TestinglcmFeatures.xlsx');
Testing = xlsread('TestingFeatures.xlsx');
[TestH,TestW] = size(Testing);
[TrainH,TrainW] =size(Training);
%% Scaling Data
Max_Values_Training = max(Training);
% Normalizing Training Data
for i=1:TrainW-1
    for j=1:TrainH
        Training(j,i) = double(Training(j,i) / Max_Values_Training(i));
    end
end
% Normalizing Testing Data
Max_Values_Testing = max(Testing);
for i=1:TestW-1
    for j=1:TestH
        Testing(j,i) = double(Testing(j,i) / Max_Values_Testing(i));
    end
end

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

Accuracy_Mat = zeros([25,2]);
%%
for K=1:TrainH
    Confusion_Mat = zeros([5,5]);
    %freqArr = zeros([1,5]);
    for i=1:TestH
        freqArr = zeros([1,5]); %% for weights
        for j=1:K
           if K == 1
             Confusion_Mat(Testing(j,TestW),Training(Indexes(j,i) ,TrainW))= Confusion_Mat(Testing(j,TestW),Training(Indexes(j,i) ,TrainW))+1;

           else
                d1 = Sorted_Distance_Table(1,i);
                dk = Sorted_Distance_Table(K,i);
                di = Sorted_Distance_Table(j,i);
                weight = double(dk-di)/(dk-d1);
                xx=Indexes(j,i);
                freqArr(1, Training(Indexes(j,i) ,TrainW)) =  freqArr(1,Training(Indexes(j,i) ,TrainW)) + weight;
            end
        end
        if K ~=1
         [MaxRes,index]= max(freqArr);
         %Confusion_Mat(index,Testing(i,16)) = Confusion_Mat(index,Testing(i,16))+1;
         Confusion_Mat(Testing(i,TestW),index) = Confusion_Mat(Testing(i,TestW),index)+1;
        end
    end
%     if K == 8
%         display(Confusion_Mat);
%     end
    Accuracy_Mat(K,1) = K;
    Accuracy_Mat(K,2) = ceil(sum(diag(Confusion_Mat)) / (sum(sum(Confusion_Mat)))*100);
end
%%
% Error Rate Matrix
%Error_Mat = 100 - Accuracy_Mat(:,2);
plot(Accuracy_Mat(:,1), Accuracy_Mat(:,2));

%plot(Accuracy_Mat(:,1), Error_Mat);