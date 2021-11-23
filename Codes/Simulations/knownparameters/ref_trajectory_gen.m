function y = ref_trajectory_gen(u)
% This is a dummy example

x_ref = u;
y_ref = u;
x_ref_dot = 1;
y_ref_dot = 1;
x_ref_ddot = 0;
y_ref_ddot = 0;
x_ref_d3dot = 0;
y_ref_d3dot = 0;

theta_ref = atan(x_ref_dot/y_ref_dot);
v_ref = abs(y_ref_dot)*(x_ref_dot^2/y_ref_dot^2 + 1)^(1/2);
omega_ref = y_ref_ddot/(x_ref_dot*(y_ref_dot^2/x_ref_dot^2 + 1)) - (x_ref_ddot*y_ref_dot)/(x_ref_dot^2*(y_ref_dot^2/x_ref_dot^2 + 1));

v_ref_dot = y_ref_ddot*((x_ref_dot^2/y_ref_dot^2 + 1)^(1/2) - x_ref_dot^2/(y_ref_dot^2*(x_ref_dot^2/y_ref_dot^2 + 1)^(1/2))) + (x_ref_dot*x_ref_ddot)/(y_ref_dot*(x_ref_dot^2/y_ref_dot^2 + 1)^(1/2));
 
omega_ref_dot = x_ref_d3dot/(y_ref_dot*(x_ref_dot^2/y_ref_dot^2 + 1)) - y_ref_ddot*(x_ref_ddot/(y_ref_dot^2*(x_ref_dot^2/y_ref_dot^2 + 1)) - (2*x_ref_dot^2*x_ref_ddot)/(y_ref_dot^4*(x_ref_dot^2/y_ref_dot^2 + 1)^2) + (2*x_ref_dot^3*y_ref_ddot)/(y_ref_dot^5*(x_ref_dot^2/y_ref_dot^2 + 1)^2) - (2*x_ref_dot*y_ref_ddot)/(y_ref_dot^3*(x_ref_dot^2/y_ref_dot^2 + 1))) - x_ref_ddot*(y_ref_ddot/(y_ref_dot^2*(x_ref_dot^2/y_ref_dot^2 + 1)) - (2*x_ref_dot^2*y_ref_ddot)/(y_ref_dot^4*(x_ref_dot^2/y_ref_dot^2 + 1)^2) + (2*x_ref_dot*x_ref_ddot)/(y_ref_dot^3*(x_ref_dot^2/y_ref_dot^2 + 1)^2)) - (x_ref_dot*y_ref_d3dot)/(y_ref_dot^2*(x_ref_dot^2/y_ref_dot^2 + 1));
 

y(1) = x_ref;
y(2) = y_ref;
y(3) = v_ref; 
y(4) = v_ref_dot ;
y(5) = theta_ref ;
y(6) = omega_ref ;
y(7) = omega_ref_dot; 

end
