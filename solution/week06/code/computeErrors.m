function [l2, h1] = computeErrors(result, k)
  result = interp2(result, k);
  n = size(result, 1);
  x = linspace(0, 1, n);
  dx =  1/ (n-1);
  [x, y] = meshgrid(x, x);
  F = (x-1).*sin(x) .* (y-1) .* sin(y);
  F = reshape(F, n, n);
  err = result-F;
  [gx, gy] = gradient(err);
  gx = gx * n;
  gy = gy * n;
  %% L2
  l2 = sqrt(trapz(trapz(err .^ 2))) * dx;
  %% H1
  h1 = sqrt(trapz(trapz(gx .^ 2 + gy .^ 2))) * dx;
  h1 = sqrt(h1^2 + l2 ^ 2);
end