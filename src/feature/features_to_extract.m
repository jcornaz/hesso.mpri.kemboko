function [flist] = features_to_extract()
% Return the list of the feature to use

    % Accelerometers features to use
    shoulder = []; %[6,8,11,15];
    elbow = [1:3,5,6]; %[1,4,6,11,12,17];
    wrist = [1:6,8,9,14,17]; %[1,3,4,5,6,8,9,10,11,12,14,17];
    palm = [1:10,14,15,17];   %[3,5,7,8,9,10,11,12,14,15,17];

    xsens = [shoulder,elbow + 17,wrist + 2*17,palm + 3*17]';
    xsens = [ones(length(xsens),1),xsens];

    % Kinect features to use
    kinect = [];   %[37;41;45;46];
    kinect = [ones(length(kinect),1)*2,kinect];

    % Features list to use
    flist = [xsens;kinect];
end

