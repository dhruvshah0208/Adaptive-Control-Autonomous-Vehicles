function out = calcad(u)
alpha = u(1);
beta = u(2);
phi = u(3);
v = u(4);
m = u(5);
C = u(6);
L_a = 1.5;
A1 = (L_a * phi) / v;
syms d ;
eqn = 2* C *(d-A1) - m*beta*cos(d) + m*alpha*sin(d) == 0;
delta = vpasolve(eqn, d);
a = alpha * cos(delta) + beta*sin(delta);

out(1) = double(a);
out(2) = double(delta);
end