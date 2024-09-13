% Main script: Call FEM solver and plot results for different N values
Ns = [10, 20, 40, 80];  % Different values for N
u_exact = @(x) (x - 1) .* sin(x);  % Exact solution
u_exact_der = @(x) sin(x)+(x-1).*cos(x);
% Load function integrate f*phi
F_load = @(i,h) 4 * (h * i - 1) * sin(h / 2)^2 * sin(h * i) / h - 2 * sin(h) * cos(h * i);

num = 10000;
delta_x = 1/num;
x = linspace(0,1,num);
u_exact_values = u_exact(x);
L2_error_list = zeros(1,4);
L2_diff_error_list = zeros(1,4);
for i = 1:length(Ns)
    N = Ns(i);
    
    % Call FEM solver to get mesh points and FEM solution
    [x_sample, u_sample] = fem_solver(N,F_load);

    % Calculate the exact solution at mesh points
    u_h = interp1(x_sample,u_sample, x);


    % Compute the L2 norm error
    L2_error = sqrt(sum((u_h - u_exact_values).^2)*delta_x);

    u_diff_h = diff(u_h)/delta_x;
    u_diff_exact = diff(u_exact_values)/delta_x;
    L2_diff_error = sum((u_diff_h - u_diff_exact).^2)*delta_x;
    L2_diff_error = sqrt(L2_error^2 + L2_diff_error);
    
    % Print the error
%    fprintf('L2 norm error with N=%d: %e\n', N, L2_error);
%    fprintf('LH1 norm error with N=%d: %e\n', N, L2_diff_error);
%    L2_error_list(i) = L2_error;
%    L2_diff_error_list(i) = L2_diff_error;
%
%    % Create a new figure for each N
%    figure;
%
%
%    % Plot the exact solution
%    plot(x, u_exact(x), 'r-', 'LineWidth', 4);hold on;
%
%    % Plot the FEM solution
%    plot(x_sample, u_sample, 'b-o', 'LineWidth', 2); 
%
%    % Configure plot settings
%    legend(['FEM Solution (N=', num2str(N), ')'], 'Exact Solution');
%    xlabel('x');
%    ylabel('u(x)');
%    title(['FEM Solution vs Exact Solution for N=', num2str(N)]);
%
%    hold off;
end


for i = 2:length(Ns)
    N_now = Ns(i);
    N_old = Ns(i-1);
    order_l2 = log(L2_error_list(i-1)/L2_error_list(i))/log(N_now/N_old);
    order_l2_diff = log(L2_diff_error_list(i-1)/L2_diff_error_list(i))/log(N_now/N_old);
    fprintf("N:%d, L2 order:%e, LH1 order:%e\n",N_now,order_l2,order_l2_diff);
end

function [res] = interp1(x, y, xi)
	cur = 2;
	res = zeros(1, length(xi));
	l = x(1);
	r = x(2);
	for i = 2:length(xi)-1
		if (xi(i) > r)
			cur = cur + 1;
			l = r;
			r = x(cur);
		end
		% now: l <= x < r
		k = (xi(i) - l) / (r - l);
		res(i) = k * y(cur) + (1 - k) * y(cur - 1);
    end
    res(1) = y(1);
    res(length(xi)) = y(length(y));
end


