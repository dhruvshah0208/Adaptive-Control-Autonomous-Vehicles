function dX = plant(X)
% X => (v,theta,phi,alpha,beta,C_y,J)
% dX => (x_dot,y_dot,v_dot,theta_dot,phi_dot)
v = X(1); theta = X(2); phi = X(3); alpha = X(4); beta = X(5); C_y = X(6); J = X(7);

L_a = 1.5;
L_b = 1.5;
F_yr = C_y*L_b*phi/v;

x_dot = v * sin(theta);
y_dot = v * cos(theta);
v_dot = alpha;
theta_dot = phi;
phi_dot = L_a/J * (beta) - 2*L_b*F_yr;

dX(1) = x_dot; dX(2) = y_dot; dX(3) = v_dot; dX(4) = theta_dot; dX(5) = phi_dot;
end