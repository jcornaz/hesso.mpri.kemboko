function [score] = f1_score(y_true,y_predicted)
    cm = confusion_matrix(y_true,y_predicted);
    macro_precision = mean(precision(cm));
    macro_recall = mean(recall(cm));
    score = 2 * macro_precision * macro_recall / (macro_precision + macro_recall);
end