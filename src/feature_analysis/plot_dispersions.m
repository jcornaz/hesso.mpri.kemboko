function [res] = plot_dispersions( occurences, sensorid, featureid )
%Plot the feature dispersion for each classes

    res = [];
    
    for i = 1: length( occurences )
        obs = occurences(i).sensor(sensorid).observation;
        [nbl,~] = size(obs);
        new = nan([nbl,11]);
        new(:, occurences(i).label + 1) = obs(:, featureid );
        res = [res; new];
    end
    
    boxplot( res );
end