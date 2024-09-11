clear;
tic
N = [10 20 40 80 160];
l2 = zeros(4, 1);
h1 = zeros(4, 1);
for i = 1:length(N)
  n = N(i);
  result = solveFE(n, N(length(N) + 1-i));
  [l2(i), h1(i)] = computeErrors(result);
end
l2cvg_ord = [0; -log(l2(2:end) ./ l2(1:end-1)) / log(2)];
h1cvg_ord = [0; -log(h1(2:end) ./ h1(1:end-1)) / log(2)];
err = [l2, h1]
ord = [l2cvg_ord, h1cvg_ord]
% x = linspace(0, 1, length(result));
% y = x.^2 .* (1-x).^2 - 1/30;
% plot(x, [result'; y])
for i = 1:length(N)
  n = N(i);
  sprintf("%d & %e & %f & %e & %f", ...
    n, l2(i), l2cvg_ord(i), h1(i), h1cvg_ord(i))
end
toc