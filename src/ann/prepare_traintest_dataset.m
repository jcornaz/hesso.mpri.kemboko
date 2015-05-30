function [train_inputs, train_outputs, test_inputs, test_outputs] = prepare_traintest_dataset(datapath,test_ratio)
 % Prepare a train and test dataset
 
    % Load data set
    dataset = load(datapath);
    occurrences = dataset.Dataset.Data.occurence;

    % Prepare dataset
    [inputs, outputs] = prepare_dataset(occurrences,features_to_extract(),true,@fourierTransform);    
    [train_inputs, train_outputs, test_inputs, test_outputs] = split_dataset( inputs, outputs, test_ratio );
end