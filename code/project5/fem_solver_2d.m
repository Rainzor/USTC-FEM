function [x, u_h] = fem_solver_2d(N, f_load, show)
    % 2nd-Order Polynomial Space
    if nargin < 3
        show = false;
    end

    %% Mesh generation
    a = 0; b = 1;  % Interval [0,1]
    n_vert = (2*N+1)*(2*N+1);
    n_grid = 2*N+1;
    n_faces = N*N*2;
    % Vertice position
    grid = linspace(a, b, n_grid);
    [x, y] = meshgrid(grid, grid);
    Vertices = [reshape(x, 1, n_vert); reshape(y, 1, n_vert)];
    % Triangle Face Indices
    Faces = zeros(6, n_faces);
    % a--h--b
    % | \   |
    % g  k  e
    % |   \ |
    % d--f--c
    for i = 1:N
        for j = 1:N
            fid = (i-1)*N+j;
            a = 2 * (i - 1) * n_grid + 2 * j - 1;
            h = a + 1;
            b = a + 2;
            
            g = a + n_grid;
            k = g + 1;
            e = g + 2;

            d = a + 2 * n_grid;
            f = d + 1;
            c = d + 2;
            % Faces(:,fid*2-1) = [d;f;c;k;a;g];
            % Faces(:,fid*2) = [b;h;a;k;c;e];
            Faces(:,fid*2-1) = [c;a;d;g;f;k];
            Faces(:,fid*2) = [a;c;b;e;h;k];
        end
    end
    % Boundary Indices
    Boundary = sort([1:n_grid-1, ...
        (n_grid-1)*n_grid+1 : n_grid * n_grid, ...
        n_grid : n_grid : n_grid * n_grid, ...`
        n_grid+1 : n_grid : n_grid * n_grid]');
    
    %% Stiffness Matrix
    % local stiffness
    localA = [1/2,   0,     1/6,   0,    -2/3,   0;
              0,     1/2,   1/6,  -2/3,   0,     0;
              1/6,   1/6,   1,    -2/3,  -2/3,   0;
              0,    -2/3,  -2/3,   8/3,   0,    -4/3;
             -2/3,   0,    -2/3,   0,     8/3,  -4/3;
              0,     0,     0,   -4/3,  -4/3,   8/3
             ];

    [li, lj] = meshgrid(1:6, 1:6);
    li = reshape(li, 36, 1);
    lj = reshape(lj, 36, 1);
    rk = reshape(localA, 36, 1);

    rows = Faces(li,:); % 36*(N*N*2)
    cols = Faces(lj,:); % 36*(N*N*2)
    values = repmat(rk,1,n_faces);

    rows = rows(:);
    cols = cols(:);
    values = values(:);

    i_is_Bd = ismember(rows, Boundary);
    j_is_Bd = ismember(cols, Boundary);
    values(i_is_Bd | j_is_Bd) = 0;
    rows = [rows;Boundary];
    cols = [cols;Boundary];
    values = [values; ones(length(Boundary),1)];
    % global stiffness
    A = sparse(rows,cols,values);
    % disp(det(A))
    if show
        spy(A);
        title('Non-zero Elements of Sparse Matrix');
        xlabel('Columns');
        ylabel('Rows');
    end

    %% Load Vector
    fv = f_load(Vertices(1,:),Vertices(2,:));
    h = 1/N;
    area = h*h;
    b = (fv*area/3)';
    [ix, iy] = meshgrid(1:2:2*N+1);
    b(sub2ind([2*N+1, 2*N+1], ix, iy)) = 0;
    b(Boundary) = 0;

    %% Solve the linear system A * u_h = b
    u_h = A \ b;
    u_h = reshape(u_h, 2*N+1, 2*N+1);
    x = Vertices;
end
