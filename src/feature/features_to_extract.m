function [flist] = features_to_extract()
% Return the list of the feature to use

    % Accelerometers features to use with standard deviation
    shoulder = 1;
    elbow = [1,2,4];
    wrist = [2,4,8,10,14,16,17];
    palm = [2,4,8:10,12,14,15];

    
    xsens_std = [shoulder,elbow + 17,wrist + 2*17,palm + 3*17];
    xsens_std = [ones(length(xsens_std),1),xsens_std',zeros(length(xsens_std),1)];
    
    % Accelerometers features to use with mean
    shoulder = [];
    elbow = 1:3;
    wrist = [8,12,14,17];
    palm = [8,12,14,17];

    xsens_mean = [shoulder,elbow + 17,wrist + 2*17,palm + 3*17];
    xsens_mean = [ones(length(xsens_mean),1),xsens_mean',ones(length(xsens_mean),1)];
  
    flist = [xsens_std;xsens_mean];
end

