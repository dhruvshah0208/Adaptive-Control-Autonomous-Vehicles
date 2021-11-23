syms time

x_ref = 150 * cos(time); % x ref
x_ref_dot = diff(x_ref, time) ;
x_ref_ddot = diff(x_ref_dot, time) ;
x_ref_d3dot = diff(x_ref_ddot, time);


y_ref = 75 * sin(2*time)/2 ; % y ref
y_ref_dot = diff(y_ref, time) ;
y_ref_ddot = diff(y_ref_dot, time) ;
y_ref_d3dot = diff(y_ref_ddot, time);


theta_ref = atan(x_ref_dot/ y_ref_dot); % theta_ref
theta_ref_dot = diff(theta_ref, time) ; % phi_ref
theta_ref_ddot = diff(theta_ref_dot, time) ; % phi_dot_ref
theta_ref_d3dot = diff(theta_ref_ddot, time);

v_ref = x_ref_dot / sin(theta_ref) ; % v_ref
v_ref_dot = diff(v_ref, time); % v_ref_dot

% inital for v_ref
% v_ref = 75*cos(2*time)*((4*sin(time)^2)/cos(2*time)^2 + 1)^(1/2)
%  
% 75*cos(2*0)*((4*sin(0)^2)/cos(2*0)^2 + 1)^(1/2) = 75

%intial for phi
% theta_ref_dot = -((2*cos(time))/cos(2*time) + (4*sin(2*time)*sin(time))/cos(2*time)^2)/((4*sin(time)^2)/cos(2*time)^2 + 1)
%  
% -((2*cos(0))/cos(2*0) + (4*sin(2*0)*sin(0))/cos(2*0)^2)/((4*sin(0)^2)/cos(2*0)^2 + 1) = -2




