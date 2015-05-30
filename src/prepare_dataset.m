function [inputs,outputs] = prepare_dataset(occurences,flist,withOutputs,ftrans)

    if nargin < 3 % by default don't gather the expected outputs
        withOutputs = false;
    end
    
    if nargin < 4 % by default use the mean transformation
        ftrans = @(x)(mean(x));
    end
    
    nbo = numel(occurences);
    [nbf,~] = size(flist);
    
    inputs = [];
    if withOutputs
        outputs = zeros(nbo,1);
    else
        outputs = nan(nbo,1);
    end
    newLine = zeros(1,nbf);
    
    for i = 1:nbo
        occurence = occurences(i);
        for j = 1:nbf
            if numel(occurence.sensor(flist(j,1)).observation) >= flist(j,2)
                newLine(j) = ftrans(occurence.sensor(flist(j,1)).observation(:,flist(j,2)));
            else
                newLine(j) = nan;
            end
        end
        inputs = [inputs;newLine];
        
        if withOutputs
            outputs(i) = occurence.label;
        end
    end
end