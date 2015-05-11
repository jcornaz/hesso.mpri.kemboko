function [res] = plotdispersions( occurrences, sensorid, featureid )
%Analyse the pertinance of a given feature and plot usefull graphes

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