% The value = 
%       Integrate[ f[x] * phi_n [x], {x, n h - h, n h + h} ]
% The formula is derived and simplified by Mathematica. See Derivatives.nb
% for more details.

function [value] = compute_fi(h, n)
  % value = -2*cos(h*n)*sin(h) + (4*(-1 + h*n)*sin(h/2)^2*sin(h*n))/h;
  x = n * h;
  value = - h * (2 * cos(x) - (x - 1) * sin(x));
end



