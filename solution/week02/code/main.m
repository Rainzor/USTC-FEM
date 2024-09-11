clear;
tic
% Grid size, ...
% compute the accurate data.
n_test = [10, 20, 40, 80]';
h1err_record = zeros(length(n_test), 1);
l2err_record = zeros(length(n_test), 1);

for ni = 1: length(n_test)
  N = n_test(ni);
  h = 1.0 / (N+1);
  x = linspace(0, 1, N + 2);
  % Stiffness matrix
  A = compute_a(N, h);
  
  % Righthand side
  fi = compute_fi(x(2:N+1), h)';
  
  % Solve the linear equation.
  u_inner = A \ fi;
  % Final result.
  u = [0; u_inner; 0];

  % Record the error.
  [l2err, h1err] = compute_error(u, x);
  l2err_record(ni) = l2err;
  h1err_record(ni) = h1err;
end

% Compute the order, and display.
l2order_record = zeros(length(n_test), 1);
h1order_record = zeros(length(n_test), 1);
for i = 2:length(n_test)
  h1order_record(i) = -log(h1err_record(i) / h1err_record(i-1)) / log(2);
  l2order_record(i) = -log(l2err_record(i) / l2err_record(i-1)) / log(2);
end
[n_test, l2err_record,l2order_record, h1err_record, h1order_record]
toc





