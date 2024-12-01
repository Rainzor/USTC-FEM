function rhs = assembleLoad(N, Th, Vert, Bd)
  % (N+1) (N+1) Points.
  n_vert = size(Vert, 2);
  fv = f(Vert);
  area_ijk = 1 / N^2;
  
  %% Hack
  rhs = 1/3 * (fv * area_ijk)';
  [ix, iy] = meshgrid(1:2:2*N+1);
  rhs(sub2ind([2*N+1, 2*N+1], ix, iy)) = 0;
  rhs(Bd) = 0;
end

function ret = f(xi)
  x = xi(1, :);
  y = xi(2, :);
  ret = -((2*cos(x) - (-1+x) .* sin(x)) .* (y-1) .* sin(y) + ...
    (x-1) .* sin(x) .* (2*cos(y) - (-1+y).*sin(y)));
end
% function ret = f(xi)
%   x = xi(1, :);
%   y = xi(2, :);
%   ret = exp(-0.5 * ((x-0.5).^2 + (y-0.5).^2 ));
% end