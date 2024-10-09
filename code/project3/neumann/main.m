clear
% Main script: Call FEM solver and plot results for different N values
Ns = [10, 20, 40, 80];  % Different values for N
u_exact = @(x) x.*x.*(x-1).*(x-1);  % Exact solution
% Load function f
f_load = @(x) -12*x.*x + 12*x - 2;

num = 10000;
delta_x = 1/num;
l2_list = zeros(4,1);
h1_list = zeros(4,1);

for i = 1:length(Ns)
    N = Ns(i);
    M = round(num/N);
    % Call FEM solver to get mesh points and FEM solution
    [x_h, u_h] = fem_solver_neumann(N, f_load);

    u_h = u_h(1:N+1)';

    % Interpolate the result.
    val = zeros(N*M+1, 1);
    t = linspace(0, 1, M+1);
    for k = 1:N
        val((k-1)*M+1:k*M+1) = p1v(u_h(k:k+1),t);
    end

    [l2_list(i), h1_list(i)] = computeErrors(val,u_exact);
    % Print the error
    fprintf('L2 norm error with N=%d: %e\n', N, l2_list(i));
    fprintf('LH1 norm error with N=%d: %e\n', N, h1_list(i));
end


l2_ord = [0; -log(l2_list(2:end) ./ l2_list(1:end-1)) / log(2)];
h1_ord = [0; -log(h1_list(2:end) ./ h1_list(1:end-1)) / log(2)];
for i = 1:length(Ns)
    fprintf("N:%d, L2 order:%e, LH1 order:%e\n",Ns(i),l2_ord(i),h1_ord(i));
end


%% Interp value
function r = p1v(coef, x)
  r = coef(1) * (1-x) + coef(2) * x;
end

%% Compute L2 and LH1 Error
function [l2, h1] = computeErrors(femr,u_exact)
  n = length(femr);
  x = linspace(0, 1, n)';
  y = u_exact(x) - 1/30;
  err = femr-y;
  % L2
  l2 = sqrt(sum(2 * err(2:n-1).^2 + err(1) ^2 + err(n) ^2) / (2 * (n-1)));
  % H1
  derr = (n-1) * (err(2:n) - err(1:n-1));
  h1 = sqrt(sum(2 * derr(2:n-2).^2 + derr(1) ^2 + derr(n-1) ^2) / (2 * (n-1)) ...
    + l2*l2);
end


