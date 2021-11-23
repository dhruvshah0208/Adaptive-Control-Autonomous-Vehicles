function estimator_variables_dot = estimator_alpha_beta(u)
% u => ( reference x & derivatives, reference y & derivatives, k1, k2, k3, k4, k5, a , delta , state vector)
% state vector => (x, y, v, theta, phi)
% reference x and derivatives => x_ref, x_ref_dot, x_ref_ddot, x_refd3dot
% reference y and derivatives => y_ref, y_ref_dot, y_ref_ddot, y_refd3dot
gains;
L_a = 1.5;
L_b = 1.5;

x_ref = u(1);
x_ref_dot = u(2);
x_ref_ddot = u(3);
x_ref_d3dot = u(4);

y_ref = u(5);
y_ref_dot = u(6);
y_ref_ddot = u(7);
y_ref_d3dot = u(8);

alpha = u(9);
beta = u(10);

x = u(11);
y = u(12);
v = u(13);
theta = u(14);
phi = u(15);

 
tau1 = L_a*beta*(phi + k4*(theta - atan((x_ref_dot - k1*(x - x_ref))/(y_ref_dot - k2*(y - y_ref)))) - x_ref_ddot/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))) + ((x - x_ref)*((x_ref_dot - k1*(x - x_ref))^2 + (y_ref_dot - k2*(y - y_ref))^2)^(1/2))/((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)^(1/2) + (y_ref_ddot*(x_ref_dot - k1*(x - x_ref)))/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))^2) - (k1*x_ref_dot)/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))) + (k1*v*sin(theta))/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))) - ((x_ref_dot - k1*(x - x_ref))*(y - y_ref)*((x_ref_dot - k1*(x - x_ref))^2 + (y_ref_dot - k2*(y - y_ref))^2)^(1/2))/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)^(1/2)*(y_ref_dot - k2*(y - y_ref))) + (k2*y_ref_dot*(x_ref_dot - k1*(x - x_ref)))/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))^2) - (k2*v*cos(theta)*(x_ref_dot - k1*(x - x_ref)))/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))^2));
 
tau2 = -(2*L_b^2*phi*(phi + k4*(theta - atan((x_ref_dot - k1*(x - x_ref))/(y_ref_dot - k2*(y - y_ref)))) - x_ref_ddot/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))) + ((x - x_ref)*((x_ref_dot - k1*(x - x_ref))^2 + (y_ref_dot - k2*(y - y_ref))^2)^(1/2))/((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)^(1/2) + (y_ref_ddot*(x_ref_dot - k1*(x - x_ref)))/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))^2) - (k1*x_ref_dot)/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))) + (k1*v*sin(theta))/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))) - ((x_ref_dot - k1*(x - x_ref))*(y - y_ref)*((x_ref_dot - k1*(x - x_ref))^2 + (y_ref_dot - k2*(y - y_ref))^2)^(1/2))/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)^(1/2)*(y_ref_dot - k2*(y - y_ref))) + (k2*y_ref_dot*(x_ref_dot - k1*(x - x_ref)))/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))^2) - (k2*v*cos(theta)*(x_ref_dot - k1*(x - x_ref)))/(((x_ref_dot - k1*(x - x_ref))^2/(y_ref_dot - k2*(y - y_ref))^2 + 1)*(y_ref_dot - k2*(y - y_ref))^2)))/v;
 

tau = [tau1; tau2];

G = [1 0;
     0 1]; 
     
param_theta_dot = G * tau;

estimator_variables_dot(1) = param_theta_dot(1);
estimator_variables_dot(2) = param_theta_dot(2);








