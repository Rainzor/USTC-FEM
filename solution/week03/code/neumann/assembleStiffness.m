function K = assembleStiffness(N)
  h = 1/N;
  % A = zeros(2*N-1, 2*N-1);
  A = zeros(N+2, N+2);
  local_stiffness = 1/h*[1, -1; -1, 1];
  %% Inner
  for i=1:N
    A(i:i+1, i:i+1) = A(i:i+1, i:i+1) + local_stiffness;
  end
  A(N+2, 1) = .5/h;
  A(N+2, N+1) = .5/h;
  A(N+2, 2:N) = 1/h;
  A(:, N+2) = A(N+2, :)';
  K = A;
end