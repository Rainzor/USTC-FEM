function K = assembleStiffness(Th, Vert, Bd)
  n_vert = size(Vert, 2);
  n_elem = size(Th, 2);
  localK = [1, -(2/3), 1/6, 0, 1/6, -(2/3); 
      -(2/3), 8/3, -(2/3), -(4/3), 0, 0;
      1/6, -(2/3), 1/2, 0, 0, 0;
      0, -(4/3), 0, 8/3, 0, -(4/3);
      1/6, 0, 0, 0, 1/2, -(2/3);
      -(2/3), 0, 0, -(4/3), -(2/3), 8/3];
  [li, lj] = meshgrid(1:6, 1:6);
  li = reshape(li, 36, 1);
  lj = reshape(lj, 36, 1);
  rk = reshape(localK, 36, 1);

  %% Hack
  i = Th(li, :);
  j = Th(lj, :);
  v = repmat(rk, 1, n_elem);
  % Setup boundaries.
  i = i(:);
  j = j(:);
  v = v(:);
  i_is_Bd = ismember(i, Bd);
  j_is_Bd = ismember(j, Bd);
  v(i_is_Bd | j_is_Bd) = 0;
  K = sparse([i; Bd], [j; Bd], [v; ones(length(Bd), 1)], n_vert, n_vert);
end