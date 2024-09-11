function K = assembleStiffness(N)
  h = 1/N;
  % A = zeros(2*N-1, 2*N-1);
  A = sparse(2*N-1, 2*N-1);
  local_stiffness = 1/h*[7/3, -8/3, 1/3;
    -8/3, 16/3,-8/3;
    1/3,-8/3, 7/3];
  % 1 -> 0+1/2
  % 2 -> 1+0
  % 3 -> 1+1/2 
  % ...
  % 2N+1 -> N+1/2
  %% Boundaries
  A(1:2, 1:2) = local_stiffness(2:3, 2:3);
  A(2*N-2:2*N-1, 2*N-2:2*N-1) = local_stiffness(1:2, 1:2);

  %% Inner
  for i=2:N-1
    nod = 2 * i-2;
    A(nod: nod+2, nod:nod+2) = A(nod:nod+2, nod:nod+2) + local_stiffness;
  end
  K = A;
end