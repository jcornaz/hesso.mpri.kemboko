function [train_inputs, train_outputs, test_inputs, test_outputs] = prepare_traintest_dataset(occurences,test_ratio,flist)
 % Prepare a train and test dataset
 
    if nargin < 3
        flist = features_to_extract();
    end

    % Prepare dataset
    [inputs, outputs] = prepare_dataset(occurences,flist,true,@fourierTransform);    
    [train_inputs, train_outputs, test_inputs, test_outputs] = split_dataset( inputs, outputs, test_ratio );
end