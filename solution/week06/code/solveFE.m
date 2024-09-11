function u = solveFE(N, display_mesh)
  %% Trianglization
  n_vert = (N+1)*(N+1);
  % Vertice position
  grid = linspace(0, 1, N+1);
  [x, y] = meshgrid(grid, grid);
  Vert = [reshape(x, 1, n_vert); reshape(y, 1, n_vert)];
  % Triangle List
  Th = zeros(3, N*N*2, 'int32');
  % Element Numbering:
  % 
  %   lt --- rt
  %   |  \ 2  |
  %   |  1 \  |
  %   lb --- rb
  for i = 1:N
    for j = 1:N
      ti = (i-1)*N+j;
      lt = (i-1)*(N+1)+j;
      rt = lt + 1;
      lb = lt + N + 1;
      rb = lt + N + 2;
      Th(:, 2 * ti - 1) = [lb; rb; lt];
      Th(:, 2 * ti) = [rt; rb; lt];
    end
  end
  % Boundary vertices.
  Bd = sort([1:N+1, ...
        (N+1)*N+1:(N+1)*(N+1), ...
        1:N+1:N*(N+1)+1, ...
        (N+1):N+1:(N+1)*(N+1)])';

  % Build Stiffness matrix and load matrix.
  K = assembleStiffness(Th, Vert, Bd);
  b = assembleLoad(Th, Vert, Bd);
  if (display_mesh)
    figure;
    spy(K);
    figure;
    hold on;
    for i = 1: length(Th)
      tri = Th(:, i);
      plot(Vert(1, tri), Vert(2, tri));
      x_bar = mean(Vert(1, tri));
      y_bar = mean(Vert(2, tri));
      text(x_bar, y_bar, sprintf("%d", i));
    end
  end

  %% Solve the equation
  u = reshape(K \ b, N+1, N+1);
end