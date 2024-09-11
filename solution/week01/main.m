clear;
% Grid size, ...
% compute the accurate data.
N_sample = 16384;
x_sample = linspace(0, 1, N_sample);
u_accurate = (x_sample - 1) .* sin(x_sample);

n_test = [10, 20, 40, 80];

for i = 1:4
  N = n_test(i);
  h = 1.0 / (N+1);
  x = linspace(0, 1, N + 2);
  % Stiffness matrix
  A = compute_a(N - 2, h);
  
  % Righthand side
  fi = zeros(1, N);
  for i = 1 : N
      fi(i) = compute_fi(h, i);
  end
  
  % Solve the linear equation.
  u_inner = fi / A;
  u = zeros(1, N + 2);
  % setup the result
  u(2:N+1) = u_inner;
  % Trapezoidal Rule for Integration
  u_sample = interp1(x, u, x_sample);
  % L2 norm
  l2err = sqrt(trapz(1 / N_sample, ((u_sample - u_accurate) .^ 2)'));
  % H2 norm, first compute the 
  u_diff_accurate = diff(u_accurate);
  u_diff_sample   = diff(u_sample);
  u_diff_err_sqr = trapz(1 / N_sample, ...
      ((u_diff_accurate - u_diff_sample) .^ 2 * N_sample * N_sample)');
  h1err = sqrt(l2err ^ 2 + u_diff_err_sqr);
  
  % Plotting
  figure()
  plot(x_sample, u_sample)
  hold on
  plot(x_sample, u_accurate)
  xlabel("x")
  ylabel("y")
  legend("FEM Solution", "Accurate Solution")
  txt = sprintf("N=%d, l2err=%f, h1err=%f", N, l2err, h1err)
  title(txt)
end