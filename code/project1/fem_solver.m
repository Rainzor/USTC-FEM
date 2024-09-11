function [x, u_h] = fem_solver(N,F_load)
    % Mesh generation
    a = 0; b = 1;  % Interval [0,1]
    h = (b - a) / N;  % Step size
    x = linspace(a, b, N+1);  % Mesh points

    % Preallocate index and value arrays for the sparse matrix
    I = zeros(3*N-5, 1);  % Row indices
    J = zeros(3*N-5, 1);  % Column indices
    S = zeros(3*N-5, 1);  % Non-zero values
    index = 0;  % Index counter

    % Construct the sparse matrix K
    for i = 1:N-1
        index = index + 1;
        I(index) = i;
        J(index) = i;
        S(index) = 2 / h;  % Diagonal element

        if i > 1
            index = index + 1;
            I(index) = i;
            J(index) = i-1;
            S(index) = -1 / h;  % Lower diagonal element
        end

        if i < N-1
            index = index + 1;
            I(index) = i;
            J(index) = i+1;
            S(index) = -1 / h;  % Upper diagonal element
        end
    end

    % Construct the sparse matrix K using the sparse function
    K = sparse(I, J, S, N-1, N-1);

    % Construct the load vector F
    F = zeros(N-1, 1);
    for j = 1:N-1
        F(j) = F_load(j,h);
    end

    % Solve the linear system K * u_h = F
    u_h = K \ F;

    % Apply boundary conditions u(0) = 0 and u(1) = 0
    u_h = [0; u_h; 0];
end
