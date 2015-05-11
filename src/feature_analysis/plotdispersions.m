function [res] = plotdispersions( occurrences, sensorid, featureid )
%Plot the feature dispersion for each classes

    res = [];
    
    for i = 1: length( occurrences )
        obs = occurrences(i).sensor(sensorid).observation;
        [nbl,~] = size(obs);
        new = nan([nbl,11]);
        new(:, occurrences(i).label + 1) = obs(:, featureid );
        res = [res; new];
    end
    
    boxplot( res );
end