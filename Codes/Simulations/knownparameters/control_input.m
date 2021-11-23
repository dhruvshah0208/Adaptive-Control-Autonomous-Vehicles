%% Controller
function control_variables = control_input(u)
% u => ( state vector, reference x & derivatives, reference y &
% derivatives, k1, k2, k3, C_y, J, k4, k5)
% state vector => (x, y, v, theta, phi)
% reference x and derivatives => x_ref, x_ref_dot, x_ref_ddot, x_refd3dot
% reference y and derivatives => y_ref, y_ref_dot, y_ref_ddot, y_refd3dot

gains;
L_a = 1.5;
L_b = 1.5;

%% States
x = u(1);
y = u(2);
v = u(3);
theta = u(4);
phi = u(5);

x_ref = u(6);
y_ref = u(10);
v_ref = u(7);
v_ref_dot = u(8);
theta_ref = u(9);
omega_ref = u(10);
omega_ref_dot = u(11);
%% Parameter Estimates
J = u(11);
C_y = u(12);
m = u(13);


alpha = v_ref_dot*cos(theta - theta_ref) - k1*(v + phi*(cos(theta)*(x - x_ref) - sin(theta)*(y - y_ref)) - v_ref*cos(theta - theta_ref)) - k4*(v + k1*(cos(theta)*(y - y_ref) + sin(theta)*(x - x_ref)) - v_ref*cos(theta - theta_ref)) + v_ref*sin(theta - theta_ref)*(omega_ref - phi);
 
beta = (J*((2*C_y*phi*L_b^2)/v + omega_ref_dot - k4*(phi - omega_ref + k3*v_ref*sin(theta - theta_ref) + k2*v_ref*(cos(theta)*(x - x_ref) - sin(theta)*(y - y_ref))) - k3*v_ref_dot*sin(theta - theta_ref) - k2*v_ref_dot*(cos(theta)*(x - x_ref) - sin(theta)*(y - y_ref)) + k2*v_ref*(phi*(cos(theta)*(y - y_ref) + sin(theta)*(x - x_ref)) - v_ref*sin(theta - theta_ref)) + k3*v_ref*cos(theta - theta_ref)*(omega_ref - phi)))/L_a;
 
e1 = sin(theta)*(x_ref - x) + cos(theta)*(y_ref - y);
e2 = -cos(theta)*(x_ref - x) + sin(theta)*(y_ref - y);
e3 = theta_ref - theta;

control_variables(1) = alpha;
control_variables(2) = beta;
control_variables(3) = e1;
control_variables(4) = e2;
control_variables(5) = e3;

end