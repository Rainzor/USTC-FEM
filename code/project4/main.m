%% Main script: Call FEM solver
% Different values for N
Ns = [10, 20, 40, 80];  
% Exact solution
u_exact = @(x,y) (x-1).*sin(x) .* (y-1) .* sin(y);  
% Load function f
f_load = @(x,y) -((2*cos(x) - (-1+x) .* sin(x)) .* (y-1) .* sin(y) + ...
                (x-1) .* sin(x) .* (2*cos(y) - (-1+y).*sin(y)));

L2_list = zeros(1,4);
H1_list = zeros(1,4);

for i = 1:length(Ns)
    N = Ns(i);

    % Call FEM solver to get mesh points and FEM solution
    [x_h, u_h] = fem_solver_2d(N, f_load);

    [L2_list(i), H1_list(i)] = computeErrors(u_h,u_exact,2);
    % Print the error
    fprintf('N:%d, L2: %e\n', N, L2_list(i));
    fprintf('N:%d, LH1: %e\n', N, H1_list(i));
end

l2cvg_ord = -log(L2_list(2:end) ./ L2_list(1:end-1)) / log(2);
h1cvg_ord = -log(H1_list(2:end) ./ H1_list(1:end-1)) / log(2);
for i = 2:length(Ns)
    fprintf("N:%d, L2 order: %e, LH1 order: %e\n",Ns(i),l2cvg_ord(i-1),h1cvg_ord(i-1));
end


%% Compute L2 and LH1 Error
function [l2, h1] = computeErrors(result,u_exact, k)
    % result = interp2(result,k);
    result = interp2_custom(result, k);
    n = size(result, 1);
    x = linspace(0, 1, n);
    dx =  1/ (n-1);
    [x, y] = meshgrid(x, x);
    F = u_exact(x,y);
    F = reshape(F, n, n);
    err = result-F;
    % [gx, gy] = gradient(err);
    [gx, gy] = gradient_custom(err);
    gx = gx * n;
    gy = gy * n;
    % L2
    % l2 = sqrt(trapz(trapz(err .^ 2))) * dx;
    l2 = sqrt(rectangle_integral(rectangle_integral(err .^ 2, dx), dx));

    % H1
    % h1 = sqrt(trapz(trapz(gx .^ 2 + gy .^ 2))) * dx;
    % h1 = sqrt(h1^2 + l2 ^ 2);
    h1 = sqrt(rectangle_integral(rectangle_integral(gx .^ 2 + gy .^ 2, dx), dx));
    h1 = sqrt(h1^2 + l2 ^ 2);
end

%% Self-Define Function
function Vq = interp2_custom(V, k)
    % 输入:
    % V - 2D矩阵，包含样本值
    % k - 整数，细分次数

    % 获取输入矩阵的尺寸
    [rows, cols] = size(V);

    % 计算细化网格的大小
    newRows = (rows - 1) * 2^k + 1;  % 新行数
    newCols = (cols - 1) * 2^k + 1;  % 新列数

    % 创建细化网格
    x = linspace(1, rows, newRows);
    y = linspace(1, cols, newCols);

    % 使用插值函数进行插值
    Vq = zeros(newRows, newCols);  % 初始化插值结果矩阵
    for i = 1:newRows
        for j = 1:newCols
            % 使用最近的4个点进行双线性插值
            x1 = floor(x(i));
            x2 = min(x1 + 1, rows);
            y1 = floor(y(j));
            y2 = min(y1 + 1, cols);
            
            % 计算插值权重
            dx = x(i) - x1;
            dy = y(j) - y1;

            % 进行双线性插值
            Vq(i,j) = (1 - dx) * (1 - dy) * V(x1, y1) + ...
                       dx * (1 - dy) * V(x2, y1) + ...
                       (1 - dx) * dy * V(x1, y2) + ...
                       dx * dy * V(x2, y2);
        end
    end
end


function integral = rectangle_integral(data, dx)
    integral = sum(data) * dx; % 矩形法
end
	
function [gx, gy] = gradient_custom(err)
    % 获取 err 矩阵的大小
    [rows, cols] = size(err);
    
    % 初始化梯度矩阵
    gx = zeros(rows, cols);
    gy = zeros(rows, cols);
    
    % 计算水平方向的梯度 gx
    for i = 1:rows
        for j = 1:cols
            if j > 1 && j < cols
                gx(i, j) = (err(i, j + 1) - err(i, j - 1)) / 2; % 中心差分法
            elseif j == 1
                gx(i, j) = err(i, j + 1) - err(i, j); % 向前差分
            elseif j == cols
                gx(i, j) = err(i, j) - err(i, j - 1); % 向后差分
            end
        end
    end

    % 计算垂直方向的梯度 gy
    for i = 1:rows
        for j = 1:cols
            if i > 1 && i < rows
                gy(i, j) = (err(i + 1, j) - err(i - 1, j)) / 2; % 中心差分法
            elseif i == 1
                gy(i, j) = err(i + 1, j) - err(i, j); % 向前差分
            elseif i == rows
                gy(i, j) = err(i, j) - err(i - 1, j); % 向后差分
            end
        end
    end
end
