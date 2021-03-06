function [best_features,best_scores] = find_best_features( occurences )
    NB_TRY = 3;
    scores = zeros([1,NB_TRY]);
    
    % Accelerometers features to use
    best_features = minfeatures();
    flist = optfeatures();
    
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
                net = feedforwardnet(12);
                net.trainParam.max_fail = 10;
                net.divideParam.trainRatio = 0.8;
                net.divideParam.valRatio = 0.2;
                net.divideParam.testRatio = 0;
                [net,~] = train(net, train_inputs', to_bool_matrix(train_outputs)');
                scores(j) = f1_score( test_outputs, to_labelid_vector( net( test_inputs' )' ) );
            end
            score = nanmedian(scores);
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

function [features] = minfeatures()
    shoulder = [];
    elbow = [1,4];
    wrist = [8,11,14,17];
    palm = [1:3,8:10,14,15];

    xsens_std = [shoulder,elbow + 17,wrist + 2*17,palm + 3*17]';
    xsens_std = [ones(length(xsens_std),1),xsens_std,zeros(length(xsens_std),1)];
    
    shoulder = [];
    elbow = [];
    wrist = [8:9];
    palm = [15,17];
    
    xsens_mean = [shoulder,elbow + 17,wrist + 2*17,palm + 3*17]';
    xsens_mean = [ones(length(xsens_mean),1),xsens_mean,ones(length(xsens_mean),1)];

    % Features list to use1
    features = [xsens_std;xsens_mean];
end

function [features] = optfeatures()
    shoulder = [1,2,6,11];
    elbow = [2,3,5,6,8,12];
    wrist = [1:6,9:10,12,15,16];
    palm = [4:7,11,12,17];

    xsens_std = [shoulder,elbow + 17,wrist + 2*17,palm + 3*17]';
    xsens_std = [ones(length(xsens_std),1),xsens_std,zeros(length(xsens_std),1)];
    
    shoulder = [1:6];
    elbow = [1:4,6];
    wrist = [10,14:17];
    palm = [8:12,14:17];
    
    xsens_mean = [shoulder,elbow + 17,wrist + 2*17,palm + 3*17]';
    xsens_mean = [ones(length(xsens_mean),1),xsens_mean,ones(length(xsens_mean),1)];

    % Features list to use
    features = [xsens_std;xsens_mean];
end
