function [nodes, best_nb_nodes, best_score, best_net] = find_how_many_hidden_nodes( inputs, outputs )
    best_score = -inf;
    best_net = [];
    best_nb_nodes = nan;
    
    MIN_NODES = 1;
    MAX_NODES = 30;
    NB_TRY = 5;
    
    scores = zeros([1,NB_TRY]);
    nodes = zeros([MIN_NODES-MAX_NODES+1,3]);
    
    for i = MIN_NODES:MAX_NODES
        for j = 1:NB_TRY
            [train_inputs, train_outputs, test_inputs, test_outputs] = split_dataset( inputs, outputs, 0.2 );
            net = feedforwardnet(i);
            net.trainParam.max_fail = 10;
            net.divideParam.trainRatio = 0.8;
            net.divideParam.valRatio = 0.2;
            net.divideParam.testRatio = 0;
            [net,~] = train(net, train_inputs', to_bool_matrix(train_outputs)');
            score = f1_score( test_outputs, to_labelid_vector( net( test_inputs' )' ) );
            scores(j) = score;
            
            if score > best_score
                best_score = score;
                best_nb_nodes = i;
                best_net = net;
            end
        end
        
        row = i-MIN_NODES+1;
        nodes(row,1) = i;
        nodes(row,2) = nanmean(scores);
        nodes(row,3) = nanmedian(scores);
        nodes(row,4) = nanmax(scores);
    end
end

