function [l2, h1] = compute_error(u, x)
  N_sample = 1024;
  % Trapezoidal Rule for Integration
  x_sample = linspace(0, 1, N_sample)';
  u_accurate = (x_sample - 1) .* sin(x_sample);
  u_sample = interp1(x, u, x_sample);
  l2 = sqrt(trapz(1 / N_sample, (u_sample - u_accurate) .^ 2));
  % Here is the bug:
  % u_diff_err_sqr = trapz(1 / N_sample, ...
  %  ((diff(u_accurate) * N_sample - diff(u_sample) * N_sample) .^ 2)');
  % 按道理讲，应该能够正确的进行报错，因为 (...)' 是一个 1x1024 的向量，不符合 scripts/Integral/trapz.m 中的行向量描述
  % 但是软件直接闪退了，我认为是C++接口设计的问题。（也算是个bug）
  u_diff_err_sqr = trapz(1 / N_sample, ...
    ((diff(u_accurate) * N_sample - diff(u_sample) * N_sample) .^ 2));
  h1 = sqrt(u_diff_err_sqr + l2^2);
end