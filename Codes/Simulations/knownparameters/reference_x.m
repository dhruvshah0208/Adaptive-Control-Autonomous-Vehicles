function x = reference_x(u)
x(1) = 3 * u; %x_ref
x(2) = 3; %x_ref_dot
x(3) = 0; %x_ref_ddot
x(4) = 0; %x_refd3dot
end