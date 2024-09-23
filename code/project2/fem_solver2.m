function [x, u_h] = fem_solver2(N,F_load)
    % Mesh generation
    a = 0; b = 1;  % Interval [0,1]
    h = (b - a) / N;  % Step size
    x = linspace(a, b, N+1);  % Mesh points

    A = sparse(N-1,N-1);
    % Construct the sparse matrix A
    for i = 2:N-1
        A(i-1,i-1) = A(i-1,i-1) + 1/h;
        A(i-1,i) = A(i-1,i) - 1/h;
        A(i,i-1) = A(i,i-1) - 1/h;
        A(i,i) = A(i,i) + 1/h;
    end
    A(1,1) = A(1,1) + 1/h;
    A(N-1,N-1) = A(N-1,N-1) + 1/h;

    % Construct the load vector F
    F = zeros(N-1, 1);
    for j = 1:N-1
        F(j) = F_load(j,h);
    end

    % Solve the linear system K * u_h = F
    u_h = A \ F;

    % Apply boundary conditions u(0) = 0 and u(1) = 0
    u_h = [0, u_h', 0];
end
