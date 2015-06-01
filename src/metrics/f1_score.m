function [score] = f1_score(y_true,y_predicted)
    cm = confusion_matrix(y_true,y_predicted);
    macro_precision = nanmean(precision(cm));
    macro_recall = nanmean(recall(cm));
    score = 2 * macro_precision * macro_recall / (macro_precision + macro_recall);
end