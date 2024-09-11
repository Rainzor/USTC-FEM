% Main script: Call FEM solver and plot results for different N values
Ns = [10, 20, 40, 80];  % Different values for N
u_exact = @(x) (x - 1) .* sin(x);  % Exact solution

% Load function integrate f*phi
F_load = @(i,h) 4 * (h * i - 1) * sin(h / 2)^2 * sin(h * i) / h - 2 * sin(h) * cos(h * i);

for i = 1:length(Ns)
    N = Ns(i);
    
    % Call FEM solver to get mesh points and FEM solution
    [x, u_h] = fem_solver(N,F_load);
    
    % Calculate the exact solution at mesh points
    u_exact_values = u_exact(x);
    
    % Compute the L2 norm error
    error = sqrt(sum((u_h - u_exact_values').^2) * (x(2) - x(1)));
    
    % Print the error
    fprintf('L2 norm error with N=%d: %e\n', N, error);
    
    % Create a new figure for each N
    figure;
    
    % Plot the FEM solution
    plot(x, u_h, 'b-o', 'LineWidth', 2); hold on;
    
    % Plot the exact solution
    plot(x, u_exact(x), 'r-', 'LineWidth', 2);
    
    % Configure plot settings
    legend(['FEM Solution (N=', num2str(N), ')'], 'Exact Solution');
    xlabel('x');
    ylabel('u(x)');
    title(['FEM Solution vs Exact Solution for N=', num2str(N)]);
    grid on;
    
    hold off;
end
