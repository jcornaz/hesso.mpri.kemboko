function [outputs] = ann_predict(inputs)
    net = load( 'nets.mat' );
    outputs = to_labelid_vector( net.ann( inputs' )' );
end