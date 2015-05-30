function [best_features,best_scores] = find_best_features( occurences )
    NB_TRY = 5;
    scores = zeros([1,NB_TRY]);
    
    % Accelerometers features to use
    xsenses = [1:12, 14:17];

    xsens = [xsenses + 17,xsenses + 2*17,xsenses + 3*17]';
    xsens = [ones(length(xsens),1),xsens];

    % Kinect features to use
    kinect = [37:39,41:43,45:46]';
    kinect = [ones(length(kinect),1)*2,kinect];

    % Features list to use
    flist = [xsens;kinect];
    
    first_feature_id = numel(xsenses) * 3 + 8;
    best_features = flist(first_feature_id,:);
    flist(first_feature_id,:) = [];
    best_scores = [];
    
    global_best_score = -inf;
    [nbf,~] = size( flist );
    while nbf > 0
        best_score = -inf;
        best_feature_id = 0;

        for i = 1:nbf
            tmpflist = [best_features;flist(i,:)];
            for j = 1:NB_TRY
                [train_inputs, train_outputs, test_inputs, test_outputs] = prepare_traintest_dataset(occurences, 0.2, tmpflist);
                [net,~] = train(feedforwardnet(10),train_inputs', to_bool_matrix(train_outputs)');
                scores(j) = f1_score( test_outputs, to_labelid_vector( net( test_inputs' )' ) );
            end
            score = mean( scores );
            if score > best_score
                best_score = score;
                best_feature_id = i;
            end
        end

        disp( best_score );
        
        if best_score > global_best_score
            global_best_score = best_score;
            best_features = [best_features;flist(best_feature_id,:)];
            best_scores = [best_scores;best_score];
            flist(best_feature_id,:) = [];
            nbf = nbf - 1;
        else
            break;
        end
        
        disp( best_features );
    end
end