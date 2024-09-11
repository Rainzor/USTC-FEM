function [l2, h1] = computeErrors(femr)
  n = length(femr);
  x = linspace(0, 1, n)';
  y = (x-1) .* sin(x);
  err = femr-y;
  %% L2
  l2 = sqrt(sum(2 * err(2:n-1).^2 + err(1) ^2 + err(n) ^2) / (2 * (n-1)));
  %% H1
  derr = (n-1) * (err(2:n) - err(1:n-1));
  h1 = sqrt(sum(2 * derr(2:n-2).^2 + derr(1) ^2 + derr(n-1) ^2) / (2 * (n-1)) ...
    + l2*l2);
end