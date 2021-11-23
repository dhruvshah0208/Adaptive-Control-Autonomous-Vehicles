%% Variables

syms x y v theta phi % state variables
syms k1 k2 k3 k4 % positive constants 
syms L_a L_b % fully knownn parmaeters
syms a delta % control inputs
syms J C_y m % unknown parameters
syms x_ref y_ref v_ref v_ref_dot% reference
syms theta_ref omega_ref omega_ref_dot% reference 

syms alpha beta

%% State Space Eqns
% Required derivatives: v_des_dot theta_des_ddot theta_des_dot phi_des_dot
F_yf = C_y*(delta - L_a*phi/v);
F_yr = C_y*L_b*phi/v;

x_dot = v * sin(theta);
y_dot = v * cos(theta);
% v_dot = cos(delta)*a - 2/m * F_yf * sin(delta);
v_dot = alpha;
theta_dot = phi;
% phi_dot = L_a/J * (m*a*sin(delta) + 2*F_yf*cos(delta)) - 2*L_b*F_yr;
phi_dot = L_a/J * (beta) - 2*L_b*F_yr;

%% Error Dynamics

e1 = sin(theta)*(x_ref - x) + cos(theta)*(y_ref - y);
e2 = -cos(theta)*(x_ref - x) + sin(theta)*(y_ref - y);
e3 = theta_ref - theta;

e1_dot = -phi*e2 + v_ref*cos(e3) - v;
e2_dot = phi*e1 - v_ref*sin(e3);
e3_dot = omega_ref - phi;

vc1 = v_ref*cos(e3) + k1*e1;
vc2 = omega_ref + k2*v_ref*e2 + k3*v_ref*sin(e3);

vc1_dot = v_ref_dot*cos(e3) + k1*e1_dot - v_ref*sin(e3)*e3_dot;
vc2_dot = omega_ref_dot + k2*v_ref_dot*e2 + k3*v_ref_dot*sin(e3) + k2*v_ref*e2_dot + k3*v_ref*cos(e3)*e3_dot;

alpha = vc1_dot + k4*(vc1 - v);
beta = vc2_dot + k4*(vc2 - phi);

e4 = v - vc1;
e5 = phi - vc2;

%% Adaptation Symbolic Calculations


Vc = k1*(e1^2 + e2^2) + 2*k1/k2 * (1 - cos(e3)) + 1/2/k4*(e4^2 + k1*e5^2/(k2*k3*v_ref));

dVc_dx = [diff(Vc,x) diff(Vc,y) diff(Vc,v) diff(Vc,theta) diff(Vc,phi)];
    
G = [0 0 0 0;
     0 0 0 0;
     -2*(delta-L_a*phi/v) 0 0 0;
     0 0 0 0;
     0 L_a*a*sin(delta) 2*L_a*(delta - L_a*phi/v)*cos(delta) -2*L_b^2*phi/v];
    
tau = (dVc_dx*G);   % This is the tuning function 
tau1 = tau(1);
tau2 = tau(2);
tau3 = tau(3);
tau4 = tau(4);
