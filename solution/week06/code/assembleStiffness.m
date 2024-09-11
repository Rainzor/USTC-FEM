function K = assembleStiffness(Th, Vert, Bd)
  n_vert = size(Vert, 2);
  n_elem = size(Th, 2);
  localK = .5 * [ 2, -1, -1;
                 -1,  1,  0;
                 -1,  0,  1];
  [li, lj] = meshgrid(1:3, 1:3);
  li = reshape(li, 9, 1);
  lj = reshape(lj, 9, 1);
  rk = reshape(localK, 9, 1);

  %% Hack
  i = Th(li, :);
  j = Th(lj, :);
  v = repmat(rk, 1, n_elem);
  % Equivalent to:
  % i = zeros(9, n_elem, "int32");
  % j = zeros(9, n_elem, "int32");
  % v = zeros(9, n_elem);
  % for idx = 1: n_elem
  %   tri = Th(:, idx)';
  %   i(:, idx) = tri(li);
  %   j(:, idx) = tri(lj);
  %   v(:, idx) = rk;
  % end

  % Setup boundaries.
  i = i(:);
  j = j(:);
  v = v(:);
  i_is_Bd = ismember(i, Bd);
  j_is_Bd = ismember(j, Bd);
  v(i_is_Bd) = 0;
  v(j_is_Bd) = 0;
  v(i_is_Bd & j_is_Bd) = 1;
  K = sparse(i, j, v, n_vert, n_vert);
end