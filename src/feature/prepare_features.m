function [inputs,outputs] = prepare_features(occurences,flist)
    nbo = len(occurences);
    nbf = len(flist)
    inputs = [];
    outputs = zeros(nbo,1);
    newLine = zeros(1,nbf);
    for i = 1:nbo
        occurence = occurences(i);
        for j = 1:nbf
            newLine(j) = fourierTransform(occurence.sensor(flist(j,1)).observation(:,flist(j,2)));
        end
        inputs = [inputs;newLine];
        outputs(i) = occurence.label;
    end
end