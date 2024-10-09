% 定义函数 f(x) = 4x(1 - x)
f = @(x) 4 * x .* (1 - x);

f1 = @(x) (2*x-1).*(x-1);
f2 = @(x) (2*x-1).*(x);

% 生成 x 的值
x = linspace(0, 1, 200);
y = f(x);

% y1 = f1(x);
% y2 = f2(x);
% 
% y = [y2,y1];
% x = linspace(0,2,400);

% 绘制图形
figure;
plot(x, y, 'b', 'LineWidth', 1);

% 设置 x 轴刻度
xticks([0, 0.5, 1]);  % 在 0, 0.5 和 1 处设置刻度
xticklabels({'$x_{i-1}$', '$x_{i-1/2}$', '$x_{i}$'});

set(gca, 'TickLabelInterpreter', 'latex');  % 设置刻度标签的解释器为 LaTeX

% 添加标题和标签
legend('$\phi_{i-1/2}$', 'Interpreter', 'latex');  % 使用 LaTeX 语法设置标题

