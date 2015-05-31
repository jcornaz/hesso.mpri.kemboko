function [inputs,outputs] = prepare_dataset(occurences,flist,withOutputs)

    if nargin < 3 % by default don't gather the expected outputs
        withOutputs = false;
    end
    
    if nargin < 4 % by default use the mean transformation
        ftrans = @(x)(mean(x));
    end
    
    nbo = numel(occurences);
    [nbf,~] = size(flist);
    
    inputs = zeros(nbo,nbf);
    newLine = zeros(1,nbf);
    
    if withOutputs
        outputs = zeros(nbo,1);
    else
        outputs = nan(nbo,1);
    end
    
    for i = 1:nbo
        occurence = occurences(i);
        for j = 1:nbf
            if numel(occurence.sensor(flist(j,1)).observation) >= flist(j,2)
                feats = abs(fft(occurence.sensor(flist(j,1)).observation(:,flist(j,2))));
                if flist(j,3) == 0
                    feat = std(feats);
                else
                    feat = mean(feats);
                end
            else
                feat = nan;
            end
            inputs(i,j) = feat;
        end
        
        if withOutputs
            outputs(i) = occurence.label;
        end
    end
end