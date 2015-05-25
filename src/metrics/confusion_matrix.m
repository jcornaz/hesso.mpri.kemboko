function [matrix] = confusion_matrix(y_true,y_predicted)
    [matrix,~] = confusionmat(y_true,y_predicted);
end