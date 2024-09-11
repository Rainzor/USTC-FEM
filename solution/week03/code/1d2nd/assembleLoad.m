function l = assembleLoad(N)
  % 2n-1 points.
  h = 1/N;
  t = linspace(0, 1, 2*N+1);
  t_nodal = t(3:2:2*N-1);
  t_inner = t(2:2:2*N);
  l=zeros(2*N-1, 1);
  l(1:2:2*N-1) = h* 2/3 * f(t_inner);
  l(2:2:2*N-2) = h* 1/3 * f(t_nodal);
end

function ret = f(x)
  ret = -(2* cos(x) -(x-1).*sin(x));
end