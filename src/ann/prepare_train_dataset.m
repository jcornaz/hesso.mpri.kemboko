% Load data set
dataset = load('./data/Dataset_segmented.mat');
occurrences = dataset.Dataset.Data.occurence;

% Prepare dataset
[inputs, outputs] = prepare_dataset(occurrences,features_to_extract(),true,@fourierTransform);
outputs = to_bool_matrix(outputs);