% The value = 
%       Integrate[ f[x] * phi_n [x], {x, n h - h, n h + h} ]
% The formula is derived and simplified by Mathematica. See Derivatives.nb
% for more details.

function [value] = compute_fi(x, h)
  value = -2 *cos(x)* sin(h) + (4*(-1 + x)*sin(h/2)^2.*sin(x))/h;
  % value = - h * (2 * cos(x) - (x - 1) .* sin(x));
end



