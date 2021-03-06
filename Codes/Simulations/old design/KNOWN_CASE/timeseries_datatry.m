tStart = 0 ; 
tEnd = 14.5;
sampleTime = 0.01;
numSteps = (tEnd / sampleTime) + 1;
time = sampleTime*(tStart:numSteps-1);
time = time';

% 8 TRAJECTORY
x_ref_data = 150 * cos(time);
x_ref_simin = timeseries(x_ref_data,time);

x_ref_dot_data = -150 * sin(time);
x_ref_dot_simin = timeseries(x_ref_dot_data,time);


y_ref_data = 75 * sin(2*time)/2;
y_ref_simin = timeseries(y_ref_data,time);

y_ref_dot_data = 75 * cos(2 * time);
y_ref_dot_simin = timeseries(y_ref_dot_data,time);


theta_ref_data = atan2(y_ref_dot_data, x_ref_dot_data);
theta_ref_simin = timeseries(theta_ref_data,time);