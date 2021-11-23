function u = controller(state)
constants

x = state(1);
y = state(2);
theta = state(3);
v1 = state(4);
v2 = state(5);
ramp_input = state(6);

x_ref = ramp_input;
y_ref = ramp_input;
v_ref = 1.414*5;
theta_ref = pi/4;
w_ref = 0;

e1 = cos(theta)*(x_ref - x) + sin(theta)*(y_ref - y);
e2 = -sin(theta)*(x_ref - x) + cos(theta)*(y_ref - y);
e3 = theta_ref - theta;

e1_dot = v2*e2 - v1 + v_ref*cos(e3);
e2_dot = -v2*e1 + v_ref*sin(e3) - d*v2;
e3_dot = w_ref - v2;

vc1 = v_ref*cos(e3) + k1*e1;
vc2 = w_ref + k2*v_ref*e2 + k3*v_ref*sin(e3);

e4 = vc1 - v2;
e5 = vc2 - v2;

u1 = k1*e1_dot - v_ref*sin(e3)*e3_dot + k4*(vc1 - v1);
u2 = k2*v_ref*e2_dot + k3*v_ref*cos(e3)*e3_dot + k4*(vc2 - v2);

u(1) = u1;
u(2) = u2;
u(3) = e1;
u(4) = e2;
u(5) = e3;
u(6) = e4;
u(7) = e5;

end