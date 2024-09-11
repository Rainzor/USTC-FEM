function val = solveFE(N, M)
  %% Solve the equation
  u = assembleStiffness(N) \ assembleLoad(N);
  u = u(1:N+1)';
  %% Interpolate the result.
  val = zeros(N*M+1, 1);
  t = linspace(0, 1, M+1);
  for i = 1:N
    val((i-1)*M+1:i*M+1) = p1v(u(i:i+1),t);
  end
end

function r = p1v(coef, x)
  r = coef(1) * (1-x) + coef(2) * x;
end