function [train_inputs, train_outputs, test_inputs, test_outputs] = split_dataset( inputs, outputs, test_ratio )
% Split a dataset (inputs and outputs) into 2 random sub dataset
% This function use the 'reservoir sampling' alogrithm

    [nbsamples,nbfeatures] = size(inputs);
    [~,nbrescol] = size(outputs);
    
    nbtests = min(nbsamples,round(nbsamples * test_ratio));
    nbtrains = nbsamples - nbtests;
    
    train_inputs = zeros([nbtrains,nbfeatures]);
    train_outputs = zeros([nbtrains,nbrescol]);
    
    test_inputs = zeros([nbtests,nbfeatures]);
    test_outputs = zeros([nbtests,nbrescol]);
    for i = 1:nbtests
        test_inputs(i,:) = inputs(i,:);
        test_outputs(i,:) = outputs(i,:);
    end
    
    for i = (nbtests+1):nbsamples
        index = rand(1,i);
        if index <= nbtests
            train_inputs(i-nbtests,:) = test_inputs(index,:);
            train_outputs(i-nbtests,:) = test_outputs(index,:);
            test_inputs(index,:) = inputs(i,:);
            test_outputs(index,:) = outputs(i,:);
        else
            train_inputs(i-nbtests,:) = inputs(i,:);
            train_outputs(i-nbtests,:) = outputs(i,:);
        end
    end
end