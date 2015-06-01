function [best_net] = ann_train( inputs, outputs, nb_hidden_nodes, nb_train )
    best_score = -inf;
    best_net = [];
    
    train_inputs = inputs';
    train_outputs = to_bool_matrix(outputs)';
    for j = 1:nb_train
        net = feedforwardnet(nb_hidden_nodes);
        net.trainParam.max_fail = 10;
        net.divideParam.trainRatio = 0.8;
        net.divideParam.valRatio = 0.2;
        net.divideParam.testRatio = 0;
        [net,~] = train(net, train_inputs, train_outputs);
        score = f1_score( outputs, to_labelid_vector( net( train_inputs )' ) );
        
        disp(score);
        if score > best_score
            best_score = score;
            best_net = net;
        end
    end
    disp(best_score);
end