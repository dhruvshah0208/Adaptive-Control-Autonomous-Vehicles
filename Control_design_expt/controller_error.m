function u = controller_error(state)
constants

e1 = state(1);
e2 = state(2);
e3 = state(3);
v1 = state(4);
v2 = state(5);

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
u(8) = vc1;
end