function [res] = plot_dispersions( occurences, sensorid, featureid, ftrans )
%Plot the feature dispersion for each classes
    
    if nargin < 4 % by default use the entity transformation
        ftrans = @(x)(x);
    end
        
    res = [];
    
    for i = 1: length( occurences )
        obs = occurences(i).sensor(sensorid).observation;
        if length(obs) > 1
            obs = ftrans( obs(:, featureid) );
        end
        nbl = length( obs );
        new = nan( [nbl,11] );
        new(:, occurences(i).label + 1) = obs;
        res = [res; new];
    end
    
    boxplot( res );
end