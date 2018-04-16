
% Reading Test Table 26 * 15 + label column
Testing = xlsread('TestingFeatures.xlsx');

%% Scaling Data
Max_Values_Training = max(Training);
% Normalizing Training Data
for i=1:15
    for j=1:25
        Training(j,i) = double(Training(j,i) / Max_Values_Training(i));
    end
end
% Normalizing Testing Data
for i=1:15
    for j=1:26
        Testing(j,i) = double(Testing(j,i) / Max_Values_Training(i));
    end
end

%% Constructing Distance Sorted Table 25 * 26
% Distance_Table That holds The distance between every pic in test and the
% other pictures in trianing.
Distance_Table = zeros([25,1]);

    for j=1:25
        %crawling on 12 features in test and training
        Temp_sum = 0;
        for k=1:15
            Temp_sum = Temp_sum + ((Testing(1,k) - Training(j,k))^2);
        end
        Distance_Table(j,1) = sqrt(Temp_sum); % Getting The Euclidean distance between Test(i,:) & Training(j,:)
    end
% sorting Distance_Table 
[Sorted_Distance_Table, Indexes] = sort(Distance_Table);

Accuracy_Mat = zeros([25,2]);
%%
for K=1:25
    Confusion_Mat = zeros([5,5]);
    %freqArr = zeros([1,5]);
    for i=1:26
        freqArr = zeros([1,5]);
        for j=1:K
           if K == 1
             Confusion_Mat(Training(Indexes(j,i) ,16),Testing(j,16))= Confusion_Mat(Training(Indexes(j,i) ,16),Testing(j,16))+1;

           else
                d1 = Sorted_Distance_Table(1,i);
                dk = Sorted_Distance_Table(K,i);
                di = Sorted_Distance_Table(j,i);
                weight = double(dk-di)/(dk-d1);
                xx=Indexes(j,i);
                freqArr(1, Training(Indexes(j,i) ,16)) =  freqArr(1,Training(Indexes(j,i) ,16)) + weight;
            end
        end
        if K ~=1
         [MaxRes,index]= max(freqArr);
         Confusion_Mat(index,Testing(i,16)) = Confusion_Mat(index,Testing(i,16))+1;
        end
    end
    Accuracy_Mat(K,1) = K;
    Accuracy_Mat(K,2) = ceil(sum(diag(Confusion_Mat)) / (sum(sum(Confusion_Mat)))*100);
end
%%
% Error Rate Matrix
%Error_Mat = 100 - Accuracy_Mat(:,2);
plot(Accuracy_Mat(:,1), Accuracy_Mat(:,2));

%plot(Accuracy_Mat(:,1), Error_Mat);