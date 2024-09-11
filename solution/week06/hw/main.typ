#set text(font: "Noto Serif CJK SC")

= Week 6

SA23001071 杨哲睿

== 1.x.1

Suppose that $Omega$ is bounded and that $1 <= p <= q <= infinity$. Prove $L^q (Omega) subset L^p (Omega)$ (Hint: use Holders inequality.) Give examples to show that the inclusion is strict if $p<q$ and false if $Omega$ is not bounded.

*Proof*: 

Holder inequality:

$ forall 1/p + 1/q = 1, f in L^p (Omega), g in L^q (Omega) quad norm(f dot g)_1 <= norm(f)_p dot norm(g)_q $

设 $f in L^q (Omega), q<oo$，即 $norm(f)_q < +oo$，即
$ (integral_Omega abs(f)^q dif x)^(1/q) < +oo => integral_Omega abs(f)^q dif x < +oo $

那么：

$ integral_Omega abs(f)^p dot 1 dif x <= (integral_Omega (abs(f)^p)^(q/p) dif x)^(p/q) (integral_Omega 1 dif x)^((q-p)/q)
  = (integral_Omega abs(f)^q dif x)^(p/q) (m(Omega))^(q/(q-p)) $

考虑到$m(Omega) < +oo$，那么

$ integral_Omega abs(f)^p dif x < +oo $

即 $norm(f)_p < oo, f in L^p(Omega)$。如果 $q = oo$，即有
$ "ess" sup {f(x)} = M < oo $
那么使得 $|f(x)| > M$ 的 $x$ 组成零测集，那显然$forall p < oo$：
$ integral_Omega abs(f)^p dif x < m(Omega) M^p < oo $
此时 $f in L^p$ 依然是成立的。综上，$L^q (Omega) subset L^p (Omega), forall 1 <= p <= q <= oo$

下面的例子是说 $p < q$ 时，包含关系严格的：考虑定义在$Omega = (0, 1)$ 上的函数 $f(x) = 1/(2 sqrt(x))$，它明显不是$L^2$的，因为：
$ integral_((0, 1)) abs(f(x))^2 dif x = 1/4 integral_((0, 1))  1/x dif x = oo $
但它是$L^1$的，这是因为：
$ integral_((0, 1)) f(x) dif x = integral_((0, 1)) 1/(2 sqrt(x)) dif x = 1 < oo $

下面的例子是说，$m(Omega) < oo$ 是必要的：考虑定义在 $Omega = [1, oo)$ 上的函数 $f(x) = 1/x$，它是$L^2$的：
$ integral_([1, oo)) 1/(x^2) dif x = 1 $
但它不是$L^1$的：
$ integral_([1, oo)) 1/x dif x = oo $

== 1.x.2

Show that the set of bounded, continuous functions on a domain $Omega$ forms a Banach space with norm $norm(dot.c)_(L^oo (Omega))$

*Proof*: 任取$f_n$ 为 $C(Omega)$ 中的柯西列，即
$ norm(f_n - f_m) -> 0 quad (n, m -> oo) $
定义
$ f(x) = lim _ (n -> oo) f_n (x) $
这样的定义是合理的，因为 $forall x in Omega$，
$ abs(f_n (x) - f_m (x)) -> 0 quad (n, m -> oo) $
即 $f_n(x)$ 是柯西列。

若不然，即$exists epsilon > 0, forall N, exists m, n > N$ 由$f_n - f_m in C(Omega)$可知，存在开球 $B_N (x)$ 满足 $abs(f_n - f_m)$在 $B_N (x)$ 上恒大于 $epsilon$，而$m(B_(N) (x)) > 0$，这与 $norm(f_n - f_m) -> 0$ 矛盾。

首先，$norm(f - f_n) -> 0 quad (n -> oo)$：任取 $forall epsilon > 0, exists N > 0, forall n, m > N$
$ norm(f_m - f_n) < epsilon $
即 $forall x in Omega, abs(f_m (x) - f_n (x)) < epsilon$，在其中令$m -> oo$，可得
$ forall x, abs(f_n (x) - f(x)) < epsilon $ 这就是
$ norm(f_n - f) -> 0 quad (N -> oo) $

我们需要说明，$f(x)$ 是连续的：固定$x$，任取$forall epsilon > 0$，因为 $norm(f_n - f) -> 0$，所以存在$n$使得：
$ forall x in Omega, quad abs(f_n (x) - f(x)) < epsilon/3 $
而 $f_n in C(Omega)$ 所以 $exists delta > 0$，使得 $abs(f_n(x) - f_n(y)) < epsilon/3$，此时
$ abs(f(x) - f(y)) < abs(f(x) - f_n(y)) + abs(f_n (x) - f(x)) + abs(f_n (y) - f(y)) < epsilon $
这说明 $f$ 连续，即$f in C(Omega)$。

我们还需要说明 $f(x)$ 是有界的。首先存在$n$使得：
$ norm(f_n - f) < 1 => forall x in Omega space abs(f_n (x) - f(x)) < 1 $
而 $f_n$ 本身是有界的，即$sup_x abs(f_n(x)) = M < oo$
那么：
$ abs(f(x)) <= abs(f_n (x)) + abs(f_n (x) - f(x)) = M + 1 < oo $
所以$f$是有界的。

综上我们说明了任何柯西列都收敛，因此$Omega$上的有界连续函数全体构成Banach空间。

== 1.x.3

Suppose that $Omega$ is bounded and that $f_j -> f$ in $L^p (Omega)$. Using Holder's inequality prove that:
$ integral_Omega f_j (x) dif x -> integral_Omega f(x) dif x quad "as" j -> oo $

*Proof: *

$ integral_Omega abs(f_j (x) - f(x)) dif x &<= (integral_Omega abs(f_j - f)^p dif x)^(1/p) (integral_Omega 1 dif x)^(p / (p-1))\
  & = (integral_Omega abs(f_j - f)^p dif x)^(1/p) (m(Omega))^(p /(p-1)) $

一方面 $Omega$ 有界，即 $m(Omega) < oo$；另一方面 $f_j -> f$，即 $integral_Omega abs(f_j - f) dif x -> 0 space(j -> oo)$。那么

$ integral_Omega abs(f_j (x) - f(x)) dif x -> 0 quad (j -> oo) $

而 $ 0 <= abs(integral_Omega f_j (x) dif x - integral_Omega f(x) dif x) <= integral_Omega abs(f_j (x) - f(x))dif x $

那么
$ integral_Omega f_j (x) dif x -> integral_Omega f(x) dif x quad "as" j -> oo $


== 1.x.6

Let $Omega = [0, 1]$ and $1 <= p < oo$. Show that the function $f$ defined:
$ f(x):=sum_(n=1)^oo 2^(-n) log abs(x - r_n) $
is in $L^p (Omega)$, and moreover, that $norm(f-f_j)_p -> 0 quad "as" j -> oo$
(Hint: first show that $log x in L^p$ and then use the fact that $L^p$ is a Banach space)

*Proof: *首先 $log x in L^p$，这是因为：

$ integral_[0,1] abs(log x)^p dif x = integral_0^oo e^(-x) x^p dif x = Gamma(p+1) < oo $

同理，
$ integral_[0, 1] abs(log (x - r_n))^p dif x &= integral_[0, r_n] abs(log (x - r_n))^p dif x + integral_[r_n, 1] abs(log (x - r_n))^p dif x \
     &< 2 Gamma(p+1) < oo $

定义 $f_j (x) = sum_(n=1)^j 2^(-n) log |x - r_n| $，显然 $f_j in L^p(Omega)$。
那么：$forall j, k > N$
$ norm(f_j - f_k) &= norm(sum_(n = j+1)^k 2^(-n) log| x - r_n|) \
  &<= sum_(n = j+1)^k 2^(-n) norm(log |x - r_n| )\ 
  &< 2 Gamma(p+1) sum_(n = j+1)^k 2^(-n)\
  &= 2^(2-n) Gamma(p+1) -> 0 quad (N -> oo) $

这说明了 ${f_j}$ 是Cauchy列，而 $L^p(Omega)$ 是Banach空间，所以其收敛到函数$f in L^p (Omega)$

