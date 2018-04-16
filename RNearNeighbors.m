function output = RNearNeighbors(features,Training)
[~,W]=size(features);
Distance_Table = zeros([25,1]);
[~,cols] =size(Training);
% for i=1:W
%     features(1,i) = features(1,i)/Max_Values_Training(1,i);
% end
for j=1:25
   %crawling on # features in test and training
    Temp_sum = 0;
    for k=1:W
        Temp_sum = Temp_sum + ((features(1,k) - Training(j,k))^2);
    end
    Distance_Table(j,1) = sqrt(Temp_sum); % Getting The Euclidean distance between Test(i,:) & Training(j,:)
end
[Sorted_Distance_Table, Indexes] = sort(Distance_Table);
%%
Vector = zeros([1,5]);
R = 2;
if W == 15
    R = 110;
elseif W == 11
    R = 110;
end

for j=1:25 
  if Sorted_Distance_Table(j, 1) < R
       Vector(1, Training(Indexes(j,1) ,cols)) = Vector(1, Training(Indexes(j,1) ,cols)) + 1;
  end
end

[~,index]= max(Vector);
output = index;
end
%%