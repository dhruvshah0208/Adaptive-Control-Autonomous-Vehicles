%% Symbolic Variables

syms x y v theta phi % state variables
syms k1 k2 k3 k4 k5 % positive constants 
syms L_a L_b % fully knownn parmaeters
syms a delta % control inputs
syms J C_y m % unknown parameters
syms x_ref x_ref_dot x_ref_ddot x_ref_d3dot % reference
syms y_ref y_ref_dot y_ref_ddot y_ref_d3dot % reference 
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

%% Auxilliary Variables and Time Derivatives
e1 = x - x_ref;
e2 = y - y_ref;


A = -k1*e1 + x_ref_dot;
B = -k2*e2 + y_ref_dot;
v_des = ((A)^2 + (B)^2 )^(1/2);
theta_des = atan((A / B));

z1 = v - v_des;
z2 = theta - theta_des;


w = v_des;
v_des_dot = diff(w,x)*x_dot + diff(w,y)*y_dot + diff(w,v)*v_dot + diff(w,theta)*theta_dot ...
        + diff(w,phi)*phi_dot + diff(w,x_ref)*x_ref_dot + diff(w,x_ref_dot)*x_ref_ddot ...
        + diff(w,y_ref)*y_ref_dot + diff(w,y_ref_dot)*y_ref_ddot + diff(w,y_ref_ddot)*y_ref_d3dot + diff(w,x_ref_ddot)*x_ref_d3dot;

w = theta_des;
theta_des_dot = diff(w,x)*x_dot + diff(w,y)*y_dot + diff(w,v)*v_dot + diff(w,theta)*theta_dot ...
        + diff(w,phi)*phi_dot + diff(w,x_ref)*x_ref_dot + diff(w,x_ref_dot)*x_ref_ddot ...
        + diff(w,y_ref)*y_ref_dot + diff(w,y_ref_dot)*y_ref_ddot + diff(w,y_ref_ddot)*y_ref_d3dot + diff(w,x_ref_ddot)*x_ref_d3dot;



    

phi_des = -k4*z2 + theta_des_dot - e1*v_des*cos(theta_des) + e2*v_des*sin(theta_des);
z3 = phi - phi_des;

w = phi_des;
phi_des_dot = diff(w,x)*x_dot + diff(w,y)*y_dot + diff(w,v)*v_dot + diff(w,theta)*theta_dot ...
        + diff(w,phi)*phi_dot + diff(w,x_ref)*x_ref_dot + diff(w,x_ref_dot)*x_ref_ddot ...
        + diff(w,y_ref)*y_ref_dot + diff(w,y_ref_dot)*y_ref_ddot + diff(w,y_ref_ddot)*y_ref_d3dot + diff(w,x_ref_ddot)*x_ref_d3dot;


%% Final expressions

alpha_out = -k3*z1 + v_des_dot - e1*sin(theta) - e2*cos(theta);
beta_out = J/L_a * (2*L_b*F_yr + phi_des_dot - k5*z3 - z2);
    
%% Adaptation Symbolic Calculations


Vc = 1/2*e1^2 + 1/2*e2^2 + 1/2*z1^2 + 1/2*z2^2 + 1/2*z3^2;
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

    
    
