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

    [L2_list(i), H1_list(i)] = computeErrors(u_h,u_exact,4);
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
    % result = interp2(result, k, 'cubic');
    result = cubicInterp2WithScaling(result,k);
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
    l2 = sqrt(rectangle_integral(rectangle_integral(err .^ 2, dx), dx));

    % H1
    h1 = sqrt(rectangle_integral(rectangle_integral(gx .^ 2 + gy .^ 2, dx), dx));
    h1 = sqrt(h1^2 + l2 ^ 2);
end

function result = cubicInterp2WithScaling(Z, k)
    % 输入：
    % Z - 网格数据矩阵，大小为 [m, n]
    % k - 缩放比例，用于控制插值后网格的大小
    % 输出：
    % result - 缩放后的插值结果矩阵

    % 获取输入数据的大小
    [m, n] = size(Z);

    % 计算新网格的大小
    new_m = round(m * k);
    new_n = round(n * k);

    % 生成查询点的网格
    [xq, yq] = meshgrid(linspace(1, n, new_n), linspace(1, m, new_m));

    % 结果矩阵初始化
    result = zeros(size(xq));

    % 遍历每个插值点
    for i = 1:numel(xq)
        x = xq(i);
        y = yq(i);

        % 获取插值点周围的4x4邻域
        x1 = floor(x) - 1;
        y1 = floor(y) - 1;

        % 边界处理，确保不会超出原始矩阵范围
        x1 = max(1, min(x1, n - 3));
        y1 = max(1, min(y1, m - 3));

        % 提取4x4邻域
        neighbors = Z(y1:y1+3, x1:x1+3);

        % 计算插值权重
        dx = x - (x1 + 1);
        dy = y - (y1 + 1);

        % 计算每一维度的三次插值
        % 首先对行进行三次插值
        interpolated_rows = zeros(1, 4);
        for j = 1:4
            interpolated_rows(j) = cubicInterpolate(neighbors(j, :), dx);
        end

        % 然后对列进行三次插值
        result(i) = cubicInterpolate(interpolated_rows, dy);
    end
end

function value = cubicInterpolate(p, t)
    % p 是 4 个点的值，t 是插值位置
    % 实现三次插值的权重计算

    % 三次插值的系数矩阵
    a0 = p(2);
    a1 = -0.5 * p(1) + 0.5 * p(3);
    a2 = p(1) - 2.5 * p(2) + 2 * p(3) - 0.5 * p(4);
    a3 = -0.5 * p(1) + 1.5 * p(2) - 1.5 * p(3) + 0.5 * p(4);

    % 计算插值值
    value = ((a3 * t + a2) * t + a1) * t + a0;
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
