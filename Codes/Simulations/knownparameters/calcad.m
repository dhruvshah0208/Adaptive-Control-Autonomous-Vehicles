function out = calcad(u)
alpha = u(1);
beta = u(2);
phi = u(3);
v = u(4);
m = u(5);
C = u(6);
coder.extrinsic('calc');
a = 3.144;
delta = 3.1444;
[a, delta] = calc(C, phi, v, beta, alpha, m);
out(1) = double(a);
out(2) = double(delta);
end