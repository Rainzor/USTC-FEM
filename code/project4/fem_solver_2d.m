function [x, u_h] = fem_solver_2d(N, f_load, show)
    if nargin < 3
        show = false;
    end

    %% Mesh generation
    a = 0; b = 1;  % Interval [0,1]
    n_vert = (N+1)*(N+1);
    % Vertice position
    grid = linspace(a, b, N+1);
    h = (b-a)/N;
    [x, y] = meshgrid(grid, grid);
    Vertices = [reshape(x, 1, n_vert); reshape(y, 1, n_vert)];
    % Triangle Face Indices
    n_faces = N*N*2;
    Faces = zeros(3, n_faces);
    % a----b
    % | \  |
    % |  \ |
    % |   \|
    % d----c
    for i = 1:N
        for j = 1:N
            fid = (i-1)*N+j;
            a = (i-1)*(N+1) + j;
            b = (i-1)*(N+1) + j + 1;
            c = (i) * (N+1) + j + 1;
            d = (i) * (N+1) + j;
            Faces(:,fid*2-1) = [a;d;c];
            Faces(:,fid*2) = [c;b;a];
        end
    end
    % Boundary Indices
    Boundary = sort([1: N+1, ...
        (N+1)*N+1: (N+1)*(N+1), ...
        1: (N+1): N*(N+1)+1, ...
        (N+1): (N+1): (N+1)*(N+1)])';
    
    %% Stiffness Matrix
    % local stiffness
    localA = .5 * [ 1, -1, 0;
                 -1,  2,  -1;
                 0,  -1,  1];
    [li, lj] = meshgrid(1:3, 1:3);
    li = reshape(li, 9, 1);
    lj = reshape(lj, 9, 1);
    rk = reshape(localA, 9, 1);

    rows = Faces(li,:); % 9*(N*N*2)
    cols = Faces(lj,:); % 9*(N*N*2)
    values = repmat(rk,1,n_faces);

    rows = rows(:);
    cols = cols(:);
    values = values(:);
    i_is_Bd = ismember(rows, Boundary);
    j_is_Bd = ismember(cols, Boundary);
    values(i_is_Bd) = 0;
    values(j_is_Bd) = 0;
    values(i_is_Bd & j_is_Bd) = 1; % diag = 1
    % global stiffness
    A = sparse(rows,cols,values);
    
    if show
        spy(A);
        title('Non-zero Elements of Sparse Matrix');
        xlabel('Columns');
        ylabel('Rows');
    end

    %% Load Vector
    fv = f_load(Vertices(1,:),Vertices(2,:));
    area = h*h;
    b = (fv*area)';
    b(ismember(1:n_vert, Boundary)) = 0;

    % Solve the linear system A * u_h = b
    u_h = A \ b;
    u_h = reshape(u_h, N+1, N+1);
    x = Vertices;
end
