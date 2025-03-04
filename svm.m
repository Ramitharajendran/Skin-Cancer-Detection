function [result]= svm(TrainingSet,GroupTrain,TestSet)


u=unique(GroupTrain);
numClasses=length(u);
result = zeros(length(TestSet(:,1)),1);


for k=1:numClasses

    G1vAll=(GroupTrain==u(k));
    models(k) = fitcsvm(TrainingSet,G1vAll);
end


for j=1:size(TestSet,1)
    for k=1:numClasses
     
        if(ClassificationSVM(models(k),TestSet(j,:))) 
            break;
        end
    end
    result(j) = k;
   
    
end
end