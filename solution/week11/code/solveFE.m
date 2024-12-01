function u = solveFE(N, display_mesh)
  %% Trianglization
  n_vert = (2*N+1)*(2*N+1);
  % Vertice position
  grid = linspace(0, 1, 2*N+1);
  [x, y] = meshgrid(grid, grid);
  Vert = [reshape(x, 1, n_vert); reshape(y, 1, n_vert)];
  % Triangle List
  Th = zeros(6, N*N*2, 'int32');
  % Element Numbering:
  %    2j-1    2j+1
  %2i-1 lt -ct- rt
  %     |  \ 2  |
  %     lc  cc  rc
  %     |  1 \  |
  %     lb -cb- rb
  n_vert = 2 * N + 1;
  for i = 1:N
    for j = 1:N
      ti = (i-1)*N+j;
      lt = n_vert * (2 * i - 2) + 2 * j - 1;
      ct = lt + 1;
      rt = lt + 2;
      lc = lt + n_vert;
      cc = lc + 1;
      rc = lc + 2;
      lb = lc + n_vert;
      cb = lb + 1;
      rb = lb + 2;
      Th(:, 2 * ti - 1) = [lb; cb; rb; cc; lt; lc];
      Th(:, 2 * ti) = [rt; ct; lt; cc; rb; rc];
    end
  end
  % Boundary vertices.
  Bd = sort([1:2*N, ...
        (n_vert-1)*n_vert+1:n_vert * n_vert, ...
        n_vert:n_vert:n_vert * n_vert, ...
        n_vert+1:n_vert: n_vert * n_vert]');

  % Build Stiffness matrix and load matrix.
  K = assembleStiffness(Th, Vert, Bd);
  % disp(det(K))
  b = assembleLoad(N, Th, Vert, Bd);
   
  % disp(K); disp(b);
  if (display_mesh)
    figure;
    spy(K);
    figure;
    hold on;
    [ix, iy] = meshgrid(1:2:2*N+1);
    for i = 1: length(Th)
      tri = Th(:, i);
      plot([Vert(1, tri), Vert(1, tri(1))], ...
           [Vert(2, tri), Vert(2, tri(1))], "Marker","o");
      x_bar = mean(Vert(1, tri));
      y_bar = mean(Vert(2, tri));
      text(x_bar, y_bar, sprintf("%d", i));
    end
  end

  %% Solve the equation
  u = reshape(K \ b, 2*N+1, 2*N+1);
end