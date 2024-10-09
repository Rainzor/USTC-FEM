function [x, u_h] = fem_solver_2ord(N,f_load)
    % Mesh generation
    a = 0; b = 1;  % Interval [0,1]
    h = (b - a) / N;  % Step size

    A = sparse(2*N-1, 2*N-1);
    local_stiffness = 1/h*[7/3, -8/3, 1/3;
                            -8/3, 16/3,-8/3;
                            1/3,-8/3, 7/3];
    % Boundaries
    A(1:2, 1:2) = local_stiffness(2:3, 2:3);
    A(2*N-2:2*N-1, 2*N-2:2*N-1) = local_stiffness(1:2, 1:2);

    % Inner
    for i=2:N-1
        nod = 2 * i-2;
        A(nod: nod+2, nod:nod+2) = A(nod:nod+2, nod:nod+2) + local_stiffness;
    end
    K = A;

    % disp(full(K*h));

    % Construct the load vector F
    x = (1: 2*N-1) / (2*N);
    F = f_load(x);
    F(1:2:2*N-1) = F(1:2:2*N-1) * h * 2/3;
    F(2:2:2*N-2) = F(2:2:2*N-1) * h * 1/3;
    F = F';
    % Solve the linear system K * u_h = F
    u_h = K \ F;
end
