function [a, delta] = calc(C_y, phi, v, beta, alpha, m)
    L_a = 10.0;
    A = (L_a * phi) / v;
    syms d ;
    eqn = 2*C_y *(d-A) - beta*cos(d) + m*alpha*sin(d) == 0;
    delta = vpasolve(eqn, d)
    a = alpha * cos(delta) + (beta/m)*sin(delta)
    F_yf = C_y * (delta - A);
    alpha_output = cos(delta)*a - 2 * F_yf * sin(delta)
    beta_output =  m*a*sin(delta) + 2*F_yf*cos(delta)
end

%[a_controlinput, d_controlinput] = calc(C_y, phi, v, beta, alpha, m)


