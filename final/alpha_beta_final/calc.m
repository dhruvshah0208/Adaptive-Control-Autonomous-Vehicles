function [a, delta] = calc(C, phi, v, beta, alpha, m)
    L_a = 1.5;
    A1 = (L_a * phi) / v;
    disp(A1)
    syms d ;
    eqn = 2* C *(d-A1) - beta*cos(d) + m*alpha*sin(d) == 0;
    delta = vpasolve(eqn, d);
    a = alpha * cos(delta) + (beta/m)*sin(delta);
end

%[a_controlinput, d_controlinput] = calc(C_y, phi, v, beta, alpha, m)


