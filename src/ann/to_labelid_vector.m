function [labelids] = to_labelid_vector(matrix,firstid)

    if nargin < 2 % by default use the mean transformation
        firstid = 0;
    end
    
    [l,c] = size(matrix);
    labelids = zeros(l,1);
    for i = 1:l
        maxid = 1;
        maxvalue = matrix(i,1);
        for j = 2:c
            if matrix(i,j) > maxvalue
                maxid = j;
                maxvalue = matrix(i,j);
            end
        end
        labelids(i) = firstid + maxid - 1;
    end
end