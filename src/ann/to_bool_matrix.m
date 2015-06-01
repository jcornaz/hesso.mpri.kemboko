function [ matrix ] = to_bool_matrix( labelids )
    vmin = min(labelids);
    vmax = max(labelids);
    matrix = zeros(numel(labelids),vmax-vmin+1);
    
    for i = 1:numel(labelids)
        matrix(i,labelids(i)-vmin+1) = 1;
    end
end

