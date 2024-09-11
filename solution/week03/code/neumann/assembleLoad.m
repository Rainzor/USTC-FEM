function l = assembleLoad(N)
  % n+2 points.
  h = 1/N;
  t = linspace(0, 1, N+1);
  l = [f(0) * 0.5 * h, h * f(t(2:N)), f(1) * 0.5 * h, 0]';
end

function ret = f(x)
  ret = - 2*(1 - 6*x + 6 * x.^2);
end