function val = solveFE(N, M)
  %% Solve the equation
  u = assembleStiffness(N) \ assembleLoad(N);
  u = [0 u' 0];
  %% Interpolate the result.
  val = zeros(N*M+1, 1);
  t = linspace(0, 1, M+1);
  for i = 1:N
    val((i-1)*M+1:i*M+1) = p2v(u(2*i-1:2*i+1),t);
  end
end

function r = p2v(coef, x)
  r = coef(1) * (2 * x - 1) .* (x - 1) + coef(2) * 4 * (1 - x) .* x ...
    + coef(3) * (2 * x - 1) .* x;
end