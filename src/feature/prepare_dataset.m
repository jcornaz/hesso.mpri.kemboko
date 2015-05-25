function [inputs,outputs] = prepare_dataset(occurences,flist,ftrans)

    if nargin < 3 % by default use the mean transformation
        ftrans = @(x)(mean(x));
    end
    
    nbo = numel(occurences);
    [nbf,~] = size(flist);
    
    inputs = [];
    outputs = zeros(nbo,1);
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
        outputs(i) = occurence.label;
    end
end