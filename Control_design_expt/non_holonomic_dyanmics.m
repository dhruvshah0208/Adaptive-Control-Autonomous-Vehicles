function y = non_holonomic_dyanmics(state)
constants;
x = state(1);
y = state(2);
theta = state(3);
v1 = state(4);
v2 = state(5);
u1 = state(6);
u2 = state(7);

x_dot = v1*cos(theta) - d*v2*sin(theta);
y_dot = v1*sin(theta) + d*v1*cos(theta);
theta_dot = v2;
v1_dot = u1;
v2_dot = u2;


y(1) = x_dot;
y(2) = y_dot;
y(3) = theta_dot;
y(4) = v1_dot;
y(5) = v2_dot;

end