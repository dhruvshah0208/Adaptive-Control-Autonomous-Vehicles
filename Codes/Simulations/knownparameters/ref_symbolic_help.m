%% This file contains symbolic expressions to get required reference variables
syms x_ref y_ref x_ref_dot x_ref_ddot x_ref_d3dot y_ref_dot y_ref_ddot y_ref_d3dot 

theta_ref = atan(x_ref_dot / y_ref_dot);
v_ref = x_ref_dot / sin(theta_ref);

w = v_ref;
v_ref_dot = diff(w,x_ref)*x_ref_dot +diff(w,y_ref)*y_ref_dot +diff(w,x_ref_dot)*x_ref_ddot +diff(w,y_ref_dot)*y_ref_ddot ...
        + diff(w,x_ref_ddot)*x_ref_d3dot +diff(w,y_ref_ddot)*y_ref_d3dot;

w = theta_ref;
omega_ref = diff(w,x_ref)*x_ref_dot +diff(w,y_ref)*y_ref_dot +diff(w,x_ref_dot)*x_ref_ddot +diff(w,y_ref_dot)*y_ref_ddot ...
        + diff(w,x_ref_ddot)*x_ref_d3dot +diff(w,y_ref_ddot)*y_ref_d3dot;

w = omega_ref;
omega_ref_dot = diff(w,x_ref)*x_ref_dot +diff(w,y_ref)*y_ref_dot +diff(w,x_ref_dot)*x_ref_ddot +diff(w,y_ref_dot)*y_ref_ddot ...
        + diff(w,x_ref_ddot)*x_ref_d3dot +diff(w,y_ref_ddot)*y_ref_d3dot;


        