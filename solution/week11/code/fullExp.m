clear;
tic
N = [10 20 40 80];
l2 = zeros(4, 1);
h1 = zeros(4, 1);
for i = 1:4
  n = N(i);
  result = solveFE(n, false);
  result
  [l2(i), h1(i)] = computeErrors(result, 4);
end
l2cvg_ord = [NaN; -log(l2(2:end) ./ l2(1:end-1)) / log(2)];
h1cvg_ord = [NaN; -log(h1(2:end) ./ h1(1:end-1)) / log(2)];
disp([N', l2, h1])
disp([N', l2cvg_ord, h1cvg_ord])
toc
