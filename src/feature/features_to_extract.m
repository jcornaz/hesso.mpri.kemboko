function [flist] = features_to_extract()
% Return the list of the feature to use

%{
    % Accelerometers features to use
    shoulder = [];
    elbow = [1:3,5,6];
    wrist = [1:6,8,9,14,17];
    palm = [1:10,14,15,17];

    xsens = [shoulder,elbow + 17,wrist + 2*17,palm + 3*17]';
    xsens = [ones(length(xsens),1),xsens];

    % Kinect features to use
    kinect = [];   %[37;41;45;46];
    kinect = [ones(length(kinect),1)*2,kinect];

    % Features list to use
    flist = [xsens;kinect];
%}

    flist = [18,21,42,48,51,59,60,61,65,66,44,63,37,53,1,38,50,55,19];
    flist = [ones(length(flist),1),flist'];
end

