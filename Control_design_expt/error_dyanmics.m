function y = error_dyanmics(x)
constants;
e1 = x(1);
e2 = x(2);
e3 = x(3);
v1 = x(4);
v2 = x(5);
u1 = x(6);
u2 = x(7);

e1_dot = v2*e2 - v1 + v_ref*cos(e3);
e2_dot = -v2*e1 + v_ref*sin(e3) - d*v2;
e3_dot = w_ref - v2;
v1_dot = u1;
v2_dot = u2;


y(1) = e1_dot;
y(2) = e2_dot;
y(3) = e3_dot;
y(4) = v1_dot;
y(5) = v2_dot;

end