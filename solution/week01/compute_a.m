function [spmt] = compute_a(N, h)
    % Fill the sparse matrix.
    % Local matrix
    K = 1/h * [1, -1; -1, 1];
    % A = zeros(n + 1);
    A = eye(N + 2) * 2;
    A(1:N+1, 2:N+2) = A(1:N+1, 2:N+2) - eye(N+1);
    A(2:N+2, 1:N+1) = A(2:N+2, 1:N+1) - eye(N+1);
    spmt = 1/h * A;
    
    % spmt = A;
end