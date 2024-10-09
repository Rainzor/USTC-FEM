function [x, u_h] = fem_solver_neumann(N,f_load)
    % Mesh generation
    a = 0; b = 1;  % Interval [0,1]
    h = (b - a) / N;  % Step size

    A = sparse(N+2, N+2);
    local_stiffness = 1/h*[1, -1; -1, 1];
    % Inner
    for i=1:N
        A(i:i+1, i:i+1) = A(i:i+1, i:i+1) + local_stiffness;
    end
    A(N+2, 1) = .5/h;
    A(N+2, N+1) = .5/h;
    A(N+2, 2:N) = 1/h;
%    A(N+2,:) = transpose(A(:,N+2);
    A(1,N+2) = .5/h;
    A(N+1,N+2)=.5/h;
    A(2:N,N+2) = 1/h;
    K = A;
    % Construct the load vector F
    x = linspace(0, 1, N+1);
    F = [f_load(0) * 0.5 * h, h * f_load(x(2:N)), f_load(1) * 0.5 * h];
    F = [F,0]';
    % Solve the linear system K * u_h = F
    u_h = K \ F;
end
