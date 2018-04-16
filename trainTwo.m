function svmStruct = trainTwo( c1 , c2 , training)
%get class1 data
class1 = getClass(c1,training);
[h1,w1] = size(class1);
L1 = ones(h1,1)*c1;
%get class2 data
class2 = getClass(c2,training);
[h2,w2] = size(class2);
L2 = ones(h2,1)*c2;
%combine classes
classes = [class1 ; class2];
%combine lables;
lables = [L1 ; L2];
%train svm
svmStruct = svmtrain(classes,lables,'kernel_function','rbf');
end

