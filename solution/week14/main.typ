= 8.2

Let $eta$ be the solution of 8.11 with $g=0$ given by 8.20:
$ eta(t) = sum_(j = 1)^M (eta^0, xi^j) e^(-mu_j t) xi^j $

(a) prove that
$ abs(dot(eta)) + abs(macron(A) eta(t)) <= C/t abs(eta^0) $

(b) Using (a) and the fact that $abs(macron(A) xi) <= C h^(-2) abs(xi)$ prove that:
$ integral_0^T (abs(dot(eta)(s)) + abs(macron(A) eta(s))) d s <= C(1 + abs(log T/h^2)) abs(eta^0) $

Proof: (a) 令 $eta^0_j = (eta^0, xi^j)$, 则

$ t macron(A) eta(t) &= sum_(j=1)^M t (eta^0, xi^j) e^(-mu_j t) macron(A) xi^j\
  &= sum_(j=1)^M (eta^0, xi^j) e^(-mu_j t) t mu_j xi^j\
 ==> abs(t macron(A) eta(t))^2  &= sum_(j=1)^M (mu_j t eta^0_j e^(-mu_j t))^2  $

因为所有的 $mu_j > 0, t> 0$，令 $x = mu_j t$，对于所有的 $x > 0$ 有$x e^(-x) <= 1/e$，因此

$ abs(t macron(A) eta(t))^2= sum_(j=1)^M (mu_j t eta^0_j e^(-mu_j t))^2 <= 1/e sum_j eta_j^2 =1/e  abs(eta^0)^2 $

另一方面：
$ abs(t dot(eta))^2 &= abs(sum_(j=1)^M (eta^0, xi^j) e^(-mu_j t) t mu_j xi^j)^2 <= 1/e  abs(eta^0)^2 $

因此，$ abs(t dot(eta))^2 + abs(t macron(A) eta(t))^2 <= 2 1/e  abs(eta^0)^2 $

利用均值不等式 $1/2 (|a| + |b|) <= (a^2+b^2)^(1/2)$：

$ abs(dot(eta)) + abs(macron(A) eta(t)) <= C/t abs(eta^0) $

(b) 由(a)得：$abs(dot(eta)) = abs(macron(A) eta)$，那么：

$ cases(
  abs(dot(eta)) + abs(macron(A) eta(t)) <= C/t abs(eta^0),
  abs(dot(eta)) + abs(macron(A) eta(t)) <= C abs(eta^0) / h^2
  ) $

当 $t < h^2$ 时，$1/h^2 <= 1/t$，因此：

$ integral_0^T (abs(dot(eta)(s)) + abs(macron(A) eta(s))) d s & <= C abs(eta^0) (integral_0^(h^2) 1/h^2 dif s + integral_(h^2)^T 1/s dif s) \
    &<= C abs(eta^0) (1 + abs(log (T/h^2))) $
