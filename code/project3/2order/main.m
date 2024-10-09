% Main script: Call FEM solver and plot results for different N values
Ns = [10, 20, 40, 80];  % Different values for N
u_exact = @(x) (x - 1) .* sin(x);  % Exact solution
% Load function f
f_load = @(x) -2*cos(x) + (x-1).*sin(x);

num = 10000;
delta_x = 1/num;
L2_list = zeros(1,4);
H1_list = zeros(1,4);

for i = 1:length(Ns)
    N = Ns(i);

    % Call FEM solver to get mesh points and FEM solution
    [x_h, u_h] = fem_solver_2ord(N, f_load);
    
    x = [0,x_h,1];
    u_h = [0,u_h',0];

    M = round(num/N);
    val = zeros(N*M+1, 1);
    t = linspace(0, 1, M+1);
    for k = 1:N
        val((k-1)*M+1:k*M+1) = p2v(u_h(2*k-1:2*k+1),t);
    end

    [L2_list(i), H1_list(i)] = computeErrors(val,u_exact);
    % Print the error
    fprintf('L2 norm error with N=%d: %e\n', N, L2_list(i));
    fprintf('LH1 norm error with N=%d: %e\n', N, H1_list(i));
end

l2cvg_ord = -log(L2_list(2:end) ./ L2_list(1:end-1)) / log(2);
h1cvg_ord = -log(H1_list(2:end) ./ H1_list(1:end-1)) / log(2);
for i = 2:length(Ns)
    fprintf("N:%d, L2 order:%e, LH1 order:%e\n",Ns(i),l2cvg_ord(i-1),h1cvg_ord(i-1));
end


%% Interp value
function r = p2v(coef, x)
  r = coef(1) * (2 * x - 1) .* (x - 1) + coef(2) * 4 * (1 - x) .* x ...
    + coef(3) * (2 * x - 1) .* x;
end

%% Compute L2 and LH1 Error
function [l2, h1] = computeErrors(femr,u_exact)
  n = length(femr);
  x = linspace(0, 1, n)';
  y = u_exact(x);
  err = femr-y;
  % L2
  l2 = sqrt(sum(2 * err(2:n-1).^2 + err(1) ^2 + err(n) ^2) / (2 * (n-1)));
  % H1
  derr = (n-1) * (err(2:n) - err(1:n-1));
  h1 = sqrt(sum(2 * derr(2:n-2).^2 + derr(1) ^2 + derr(n-1) ^2) / (2 * (n-1)) ...
    + l2*l2);
end


