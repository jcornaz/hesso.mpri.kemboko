function [ matrix ] = to_bool_matrix( values )
    vmin = min(values);
    vmax = max(values);
    matrix = zeros(numel(values),vmax-vmin+1);
    
    for i = 1:numel(values)
        matrix(i,values(i)-vmin+1) = 1;
    end
end

