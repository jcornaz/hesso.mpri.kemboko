% Accelerometers
shoulder = [6,8,11,15];
elbow = [1,4,6,11,12,17];
wrist = [1,3,4,5,6,8,9,10,11,12,14,17];
palm = [3,5,7,8,9,10,11,12,14,15,17];

xsens = [shoulder,elbow + 17,wrist + 2*17,palm + 3*17]';
xsens = [ones(length(xsens),1),xsens];

% Kinect
kinect = [37;41;45;46];
kinect = [ones(length(kinect),1)*2,kinect];

flist = [xsens;kinect];
