function [predicted] = ann_test( testset_path )

    dataset = load(testset_path);
    occurences = dataset.Dataset.Data.occurence;
    flist = features_to_extract();
    [inputs,~] = prepare_dataset(occurences,flist,false,@fourierTransform);
    
    predicted = ann_predict(inputs);
    
    filename = 'results.txt';
    fid = fopen(filename, 'w');
    dlmwrite(filename,predicted,'-append',... 
     'delimiter',' ',...
     'newline','pc');
    fclose(fid);
end