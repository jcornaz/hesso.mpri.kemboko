function [res] = precision(confusion_matrix)
    [nb,~] = size(confusion_matrix);
    res = zeros(1,nb);
    for i = 1:nb
        res(i) = confusion_matrix(i,i) / sum(confusion_matrix(:,i));
    end
end