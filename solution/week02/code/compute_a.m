function [spmt] = compute_a(N, h)
    % Fill the sparse matrix.
    % Local matrix
    K = 1/h * [1, -1; -1, 1];
    % A = zeros(n + 1);
    A = zeros(N);
    A(1, 1) = 1/h;
    A(N, N) = 1/h;
    for i = 1: N-1
      A(i:i+1, i:i+1) = K + A(i:i+1, i:i+1);
    end
    spmt = A;
    % spmt = sparse(A);
end