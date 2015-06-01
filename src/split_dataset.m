function [train_inputs, train_outputs, test_inputs, test_outputs] = split_dataset( inputs, outputs, test_ratio )
% Split a dataset (inputs and outputs) into 2 random sub dataset
    [nb,~] = size(inputs);
    [trainids,~,testids] = dividerand(nb,1-test_ratio,0,test_ratio);
    train_inputs = inputs(trainids,:);
    train_outputs = outputs(trainids,:);
    test_inputs = inputs(testids,:);
    test_outputs = outputs(testids,:);
end