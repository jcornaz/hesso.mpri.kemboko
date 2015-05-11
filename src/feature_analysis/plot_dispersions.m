function [res] = plot_dispersions( occurences, sensorid, featureid )
%Plot the feature dispersion for each classes

    res = [];
    
    for i = 1: length( occurences )
        obs = occurences(i).sensor(sensorid).observation;
        [nbl,nbc] = size(obs);
        if nbc == 84
            new = nan([nbl,11]);
            new(:, occurences(i).label + 1) = obs(:, featureid );
            res = [res; new];
        end
    end
    
    boxplot( res );
end