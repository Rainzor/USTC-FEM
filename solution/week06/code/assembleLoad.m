function rhs = assembleLoad(Th, Vert, Bd)
  % (N+1) (N+1) Points.
  n_vert = size(Vert, 2);
  rhs = zeros(n_vert, 1);
  fv = f(Vert);
  tri = Th(:, 1);
  i = tri(1); j = tri(2); k = tri(3);
  area_ijk = abs(det([1, Vert(:, i)'; 1, Vert(:, j)'; 1, Vert(:, k)']));
  
  %% Hack
  rhs = (fv * area_ijk)';
  % For our regular grid, the line above is equivalent to: (if we donot
  % consider the correctness of boundary)
  % scale = area_ijk / 6;
  % fv = (fv * scale)';
  % for tri = Th
  %   rhs(tri) = rhs(tri) + fv(tri);
  % end
  % disp(size(fv))
  % disp(rhs - fv * area_ijk);
  rhs(ismember(1:n_vert, Bd)) = 0;
end

function ret = f(xi)
  x = xi(1, :);
  y = xi(2, :);
  ret = -((2*cos(x) - (-1+x) .* sin(x)) .* (y-1) .* sin(y) + ...
    (x-1) .* sin(x) .* (2*cos(y) - (-1+y).*sin(y)));
end