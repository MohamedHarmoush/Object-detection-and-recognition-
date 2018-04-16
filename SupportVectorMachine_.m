function  classes  = SupportVectorMachine( testing , training )
class1 = training(1:5,:);
class2 = training(6:10,:);
class3 = training(11:15,:);
class4 = training(16:20,:);
class5 = training(21:25,:);
a1 = ones(1,5);
a2 = zeros(1,5);
a2 = a2+2;
a3 = zeros(1,5);
a3 = a3+3;
a4 = zeros(1,5);
a4 = a4+4;
a5 = zeros(1,5);
a5 = a5+5;

svmstruct12 = svmtrain([class1;class2],[a1';a2'],'kernel_function', 'mlp');
svmstruct13 = svmtrain([class1;class3],[a1';a3'],'kernel_function', 'mlp');
svmstruct14 = svmtrain([class1;class4],[a1';a4'],'kernel_function', 'mlp');
svmstruct15 = svmtrain([class1;class5],[a1';a5'],'kernel_function', 'mlp');
svmstruct23 = svmtrain([class2;class3],[a2';a3'],'kernel_function', 'mlp');
svmstruct24 = svmtrain([class2;class4],[a2';a4'],'kernel_function', 'mlp');
svmstruct25 = svmtrain([class2;class5],[a2';a5'],'kernel_function', 'mlp');
svmstruct34 = svmtrain([class3;class4],[a3';a4'],'kernel_function', 'mlp');
svmstruct35 = svmtrain([class3;class5],[a3';a5'],'kernel_function', 'mlp');
svmstruct45 = svmtrain([class4;class5],[a4';a5'],'kernel_function', 'mlp');

%%

con = zeros(5,5);
[H,W] = size(testing);
%x = zeros(H,1);
testing = [testing];
for i = 1:H
    classes = zeros(1,5);
    c = svmclassify(svmstruct12,testing(i,:));
    classes(c) = classes(c) + 1;
    c = svmclassify(svmstruct13,testing(i,:));
    classes(c) = classes(c) + 1;
    c = svmclassify(svmstruct14,testing(i,:));
    classes(c) = classes(c) + 1;
    c = svmclassify(svmstruct15,testing(i,:));
    classes(c) = classes(c) + 1;
    c = svmclassify(svmstruct23,testing(i,:));
    classes(c) = classes(c) + 1;
    c = svmclassify(svmstruct24,testing(i,:));
    classes(c) = classes(c) + 1;
    c = svmclassify(svmstruct25,testing(i,:));
    classes(c) = classes(c) + 1;
    c = svmclassify(svmstruct34,testing(i,:));
    classes(c) = classes(c) + 1;
    c = svmclassify(svmstruct35,testing(i,:));
    classes(c) = classes(c) + 1;
    c = svmclassify(svmstruct45,testing(i,:));
    classes(c) = classes(c) + 1;
     
    [~,I] = sort(classes,2);
%    con(I(5),testing(i,W)) = con(I(5),testing(i,W)) + 1;
end
%acc = sum(diag(con)) / 26;
%display(acc);
%display(con);
classes = I(5);
end