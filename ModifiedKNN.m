function output = ModifiedKNN(features,Training)
[~,W]=size(features);
Distance_Table = zeros([25,1]);
%% Scaling Data
Max_Values_Training = max(Training);
% Normalizing Training Data
for i=1:W
    for j=1:25
        Training(j,i) = double(Training(j,i) / Max_Values_Training(i));
    end
    %features(1,i) = double(features(1,i)/Max_Values_Training(i));
end

for i=1:W
    features(1,i) = features(1,i)/Max_Values_Training(1,i);
end
for j=1:25
   %crawling on # features in test and training
    Temp_sum = 0;
    for k=1:W
        Temp_sum = Temp_sum + ((features(1,k) - Training(j,k))^2);
        %Temp_sum = Temp_sum + abs(features(1,k) - Training(j,k));
    end
    Distance_Table(j,1) = sqrt(Temp_sum); % Getting The Euclidean distance between Test(i,:) & Training(j,:)
    %Distance_Table(j,1) = Temp_sum;
end
[Sorted_Distance_Table, Indexes] = sort(Distance_Table);
%%
freqArr = zeros([1,5]);
K = 6; %% W == 4 glcm
if W == 15
    K = 8;
elseif W == 11
    K =9;
end
xt =[];
[~,cols] = size(Training);
Distances = zeros(K,2);
Distances = Sorted_Distance_Table(1:K,1);
for j=1:K
d1 = Sorted_Distance_Table(1,1);
dk = Sorted_Distance_Table(K,1);
di = Sorted_Distance_Table(j,1);
 if ( dk == d1 ) 
       weight = 1 ;
 else
        weight = double(dk-di)/(dk-d1);
 end
xx=Indexes(j,1);
xs =Training(Indexes(j,1) ,cols);
xt =[xt;Training(Indexes(j,1) ,cols)];

freqArr(1, Training(Indexes(j,1) ,cols)) =  freqArr(1,Training(Indexes(j,1) ,cols)) + weight;
end
[~,index]= max(freqArr);
%K = 1;
% Distances = zeros(K,2);
% Distances = Sorted_Distance_Table(1:K,1);
Distances(1:K,2)=  xt;

%[classId] = recognizeTheObject(Distances);
output = index;
end
%%