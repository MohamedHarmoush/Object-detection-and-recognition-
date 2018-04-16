function [classId] = recognizeTheObject(Distances)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% [1]:classId ,[2]:Weight 
classes = double(zeros(5,2));
for i =1:5 
 classes(i,1) = i ;
end
 Distance1 =double(min(Distances(:,1))); 
 DistanceK =double(max(Distances(:,1))); 
 
 [h,~] = size(Distances);
 for i=1:h
     if ( DistanceK == Distance1 ) 
         Weight = 1 ;
     else 
         Weight =  double(DistanceK - Distances(i,1)) /double(DistanceK - Distance1);
     end
     classes(Distances(i,2),2) =classes(Distances(i,2),2) + Weight ; 
 end
 classes = sortrows(classes,2);
 classId = classes(end,1);
end

