% Load data set
dataset = load('./data/Dataset_segmented.mat');
occurrences = dataset.Dataset.Data.occurence;

% Prepare dataset
[inputs, outputs] = prepare_dataset(occurrences,true,features_to_extract(),@fourierTransform);
outputs = to_bool_matrix(outputs);