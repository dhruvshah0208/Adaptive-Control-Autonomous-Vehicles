function unknown_params = estimate_three_unknowns(u)
t1 = u(1);
t2 = u(2);
t3 = u(3);
t4 = u(4);

% C/m = t1
% m/J = t2
% C/J = t3
% C = t4
% J = t4/ t3
% m = t2 * t4 / t3

C = t4;
J = t4 / t3;
m = t2 * t4 / t3;

unknown_params(1) = double(C);
unknown_params(2) = double(J);
unknown_params(3) = double(m);

% J = 4000
% C = 11500
% m = 2000
% C/m = 5.75
% m/j = 0.5
% C/J = 2.875
% C = 11500
end