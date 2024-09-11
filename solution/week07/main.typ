#set text(font: "Noto Serif CJK SC")
SA23001071 杨哲睿

== 1.x.8

Prove that $(diff / (diff x))^alpha abs(x) = x^(alpha) / abs(x)$ for all $x != 0$ and $abs(alpha) = 1$.

Proof: 令$x = (x_1, x_2, ..., x_n)$，显然$abs(x) = sqrt(sum_(i=1)^n x_i^2)$

$ (diff abs(x))/(diff x_i) = (2x_i) / (2 sqrt(sum_(i=1)^n x_i^2)) = x_i / abs(x) $

这就说明了：

$ (diff / (diff x))^alpha abs(x) = x^(alpha) / abs(x),quad forall x != 0, abs(alpha) = 1 $

== 1.x.9

Prove proposition 1.2.7. (Hint: use integration by parts and the fact that $C^0 subset L_("loc")^1 (Omega)$)

Proof：我们采用递推法进行说明。取$psi in C^n (Omega)$：

Step 1：对于$abs(alpha) = 0$，定理成立，即
$ integral_Omega psi(x) phi(x) dif x = integral_Omega psi(x) g(x) dif x $
这是平凡的。

Step 2：对于 $abs(alpha) = 1$，$forall phi in C_0^oo (Omega)$，
由 Green 公式可知：
$ integral_Omega phi(x) (diff psi)/(diff x_i) (x) dif x = - integral_Omega phi(x) (diff psi)/(diff x_i) (x) dif x + integral_(diff Omega) phi(x) psi(x) bold(n) dot dif S $
而因为$phi$在$Omega$ 上有紧支集，从而
$ integral_(diff Omega) phi(x) psi(x) bold(n) dot dif S = 0 $
因此
$ integral_Omega phi(x) (diff psi)/(diff x_i)(x) dif x = - integral_Omega phi(x) (diff psi)/(diff x_i) (x) dif x $
成立，另外，因为 $(diff psi)/(diff x_i) in C^0 (Omega) subset L_("loc")^1(Omega)$
那么对于 $abs(alpha) = 1$，有：
$ D_w^alpha psi = psi^((alpha)) $

Step 3：假设对于 $abs(alpha) < k <= n$ 定理成立，即
$ integral_Omega psi^((alpha)) phi(x) dif x = (-1)^(abs(alpha)) integral_Omega psi(x) phi^((alpha))(x) dif x $
证明对于 $abs(alpha') = k$ 成立。我们说明如下的事实：
对于如下的多重指标
$ alpha' = (alpha_1, alpha_2, ..., alpha_i + 1, ... , alpha_n), alpha = (alpha_1, ..., alpha_n), beta = (0, ..., underbrace(1,i"-th"), ..., 0) $
有：
$ D_w^(alpha') psi = psi^((alpha')) = D^(beta) (D^(alpha) psi) $
因为 $k<=n$，所以强导数 $D^(alpha) psi in C^1 (Omega)$，利用Green公式，以及 $phi$ 具有紧支集，
$ integral_Omega (diff psi^((alpha)))/(diff x_i) phi(x) dif x = (-1)^(abs(alpha) + 1) integral_Omega psi (diff phi^((alpha)))/(diff x_i) (x) dif x $
上面的式子就是：
$ integral_Omega psi^(alpha') phi(x) dif x = (-1)^(abs(alpha')) integral_Omega psi(x) phi^((alpha'))(x) dif x $
另外，$D^(alpha') psi in C^0(Omega) subset L_("loc")^1(Omega)$，
从而对于 $abs(alpha') = k$，$D^(alpha')_w psi = D^(alpha') psi$ 成立。

综上所述，对于$psi in C^(abs(alpha))$，有$D^(alpha)_w psi = D^(alpha) psi$.

== 1.x.10
Prove that weak derivatives of order greater than one of the function, $f$, in Example 1.2.5 do not exist.

$f(x) = 1 - abs(x)$

Proof：定义域为$[-1, 1]$区间，不使用多重指标来表示导数。假设弱导数存在，对 $k >= 2$，弱导数$D_w^(k) f = g_k in L_("loc") ([-1, 1])$，成立如下的：
$ forall phi in C_0^oo (Omega), quad integral_(-1)^1 g_k (x) phi(x) dif x =(-1)^k integral_(-1)^1 f(x) phi^((k))(x) dif x $
因为其1阶弱导数存在，因此，对等式右端用一阶的弱导数替换：
$ integral_(-1)^1 g_k (x) phi(x) dif x =(-1)^(k-1) integral_(-1)^1 g(x) phi^((k-1))(x) dif x $
其中 $g(x)$ 为 $D^1_w f$表达式如下：
$ g(x) = cases(1 quad & x < 0, -1 & x > 0) $
那么，由 $phi$ 有紧支集:
$ integral_(-1)^1 g_k (x) phi(x) dif x &=(-1)^(k-1) (integral_(0)^1  phi^((k-1))(x) dif x - integral_(-1)^0  phi^((k-1))(x) dif x)\
  &= (-1)^(k-1)(phi^((k-2))(1) - phi^((k-2))(0) - phi^((k-2))(0) + phi^((k-2))(-1)) \
  &= 2 phi^((k-2))(0) (-1)^k $
定义如下的函数，其中 $xi > 0$：
$ phi(x) = cases(exp((-abs(x)^k)/(xi^k - abs(x)^k)) quad& abs(x) <= xi, 0& "otherwise") $
显然 $psi(0) = 1, forall xi > 0, psi^((i-1)) (0) = 0, forall 0 < i < k$，从而
// $ Psi_i (x) = integral_(-1)^x Psi_(i-1) (x) dif x, Psi_0 (x) = phi(x) ==> Psi_i^((i)) (x) = phi(x) $
// 令
// $ phi(x) = psi(x) dot Psi_(k-2) (x) $
// 对$phi$求出$k-2$次导数，并考察在 $0$ 的取值，由莱布尼兹公式，其中由于 $psi^((k)) (x) = 0, forall k > 0$，因此只有：
// $ phi^((k-2)) (0) = Psi_(k-2)^((k-2)) (0) dot psi(0) = psi(0)^2 = 1 $
// 考虑 $phi$ 的2范数：
// $ Psi_0(x) &= phi(x) < 1\
//   Psi_1(x) &<= integral_(-xi)^(xi) phi(x) < 2 xi\
//   Psi_2(x) &<= integral_(-xi)^(xi) phi(x) < (2 xi)^2\
//   ...\
//   Psi_i (x) &<= (2 xi)^i $
// $ ==> integral_(-1)^1 phi(x)^2 dif x < integral_(-xi)^(xi) Psi_(k-2)^2 (x) dif x <= (2 xi)^(2(k-2)) ==> norm(phi) < (2 xi)^(k-2) $

$ phi(x) < 1 => integral_(-xi)^xi phi(x)^2 dif x <= 2 xi $

对于先前的公式利用Cauchy不等式可知：
$ norm(g_k) norm(phi) > abs(2 phi^((k-2)) (0) (-1)^k) = 2 abs(phi^((k-2))(0)) = 2 $
因为 $g_k in L^1([-1, 1])$，那么$g_k in L^2([-1, 1])$，即 $norm(g_k) = M_k < oo$
$ M_k (2 xi) > 2 quad forall xi > 0 $
令 $xi -> 0$ 矛盾。因此高于1阶的弱导数都不存在。

== 1.x.13

Let $f(x) = abs(x)^r$ for a given real number $r$. Prove that $f$ has first-order weak derivative on the unit ball provided that $r > 1-n$.

$ (diff f)/(diff x_i) = r x_i abs(x)^(r-2) $
首先验证，对于$r>1-n$它是$L^1$的。
$ abs(x_i abs(x)^(r-2)) <= abs(x)^(r-1) $
以下说明 $abs(x)^(r-1)$在$RR^n$中的单位球$B$ 有 $L^1$可积。
$ integral_B abs(x)^(r-1) dif x &= integral_0^1 n omega_(n-1) abs(x)^(n-1) abs(x)^(r-1) dif abs(x)\
  &= n omega_(n-1)integral_0^1 abs(x)^(n + r - 2) dif x $
其中的 $n omega_(n-1)$ 为 $RR^n$ 中的单位球面面积。因为 $r > 1-n$，所以 $n+r> 1$，从而上面的积分
$ integral_B abs(x)^(r-1) dif x &= (n omega_(n-1))/(n + r - 1) $
而因为 $abs(x_i abs(x)^(r-2)) <= abs(x)^(r-1)$，从而 $x_i abs(x)^(r-2)$是$L^1$的。

还需要验证 $forall phi in C^oo_0 (B)$ 有
#let spAr = $B-macron(B)_epsilon$
#let smallBall=$macron(B)_epsilon$
$ integral_B phi(x)f_i (x) dif x = - integral_B phi_i (x) f(x) dif x $
设 $epsilon > 0$，以及闭球 $macron(B)_epsilon = { abs(x) <= epsilon }$，那么对于区域 $B - macron(B)_epsilon$利用Green公式有：
$ integral_B phi(x) f_i dif x &= integral_spAr phi(x) f_i (x) dif x + integral_smallBall phi(x) f_i (x) dif x\
  &= - integral_spAr phi_i (x) f(x) dif x - integral_(diff smallBall) epsilon^r phi(x) n_i dif S + integral_(smallBall) phi(x) f_i (x) dif x $

一方面，因为 $phi in C^oo_0 (Omega)$，从而在 $forall x in smallBall$ 有 $abs(phi(x)) <= M < oo$，
$ 0 <= abs(integral_(diff smallBall) epsilon^r phi(x) n_i dif S) <= n omega_(n-1) epsilon^(r+n-1) M -> 0 quad (epsilon -> 0) $
另一方面，因为 $forall x in smallBall$，$abs(f_i) < abs(x)^(r-1)$，从而
$ 0 <= abs(integral_smallBall phi(x) f_i (x) dif x) <= M norm(f_i)_1 <= M norm(abs(x)^(r-1))_1 <= (M n omega_(n-1))/(n+r - 1) epsilon^(n+r-1) -> 0 quad (epsilon -> 0) $
因此，令 $epsilon -> 0$ 可得：
$ integral_B phi(x) f_i (x) dif x = - integral_B phi_i (x) f(x) dif x $



== 1.x.16

Let $n = 1$, $Omega = [a, b]$, and $f in W_1^1 (Omega)$. Prove that:
$ integral_a^b D_w^1 f(x) dif x = f(b) - f(a) $
under the assumption that $f$ is continious at $a$ and $b$

Proof：构造如下的函数 $phi$ 其中 $k > 1$
$ phi = exp (-abs(x-(a+b)/2)^k/(((b-a)/2)^k - abs(x-(a+b)/2)^k)) $
不难验证，$phi in C^oo_0 [a,b]$，以及对于$epsilon = (b-a)/(2k^2)$， $forall a + epsilon  < x < b - epsilon$
$ 1 >= phi(x) > exp (-abs(x-(a+b)/2)^k/((b-a)/2)^k) >= exp(-abs(1-1/k^2)^k) >= abs(1-1/k^2)^k >= 1 - 1/k $
// $ norm(phi - 1)_1 = integral_a^(a+epsilon) 1 - phi(x) dif x + integral_(b-epsilon)^b 1 - phi(x) dif x < 2 epsilon $

通过弱导数定义可得：
$ integral_a^b D_w^1 f(x) phi(x) dif x = - integral_a^b phi'(x) f(x) dif x $

此时
$ abs(integral_a^b D_w^1 f(x) phi(x) dif x - integral_a^b D_w^1 f(x) dif x) < (b-a)/k norm(D_w^1 f(x))_1 $

因为 $f$ 在 $a, b$ 连续，所以对 $delta > 0$，当 $epsilon$ 充分小时，
$ forall a <= x <= a + epsilon,& abs(f(x) - f(a)) < delta\ forall b <= x <= b + epsilon,&abs(f(x) - f(b))< delta quad $
考虑如下的积分：
$ integral_a^b phi' f dif x = integral_a^(a+epsilon) phi' f(x) dif x + integral_(b-epsilon)^b phi' f (x) dif x + integral_(a+epsilon)^(b-epsilon) phi' f(x) dif x $
对于
$ abs(integral_(a+epsilon)^(b-epsilon) phi' f(x) dif x) <= norm(f)_1 sup_(a + epsilon < x < b - epsilon)(phi'(x)) $
因为 $phi'(x) < 2/(k(b-a))$ 所以：
$ abs(integral_(a+epsilon)^(b-epsilon) phi' f(x) dif x) <= (2norm(f)_1)/(k(b-a))  $
另外
$ abs(integral_a^(a+epsilon) phi'(x) f(x) dif x -f(a)) &= abs(f(a) (integral_a^(a+epsilon) phi'(x) dif x-1) + integral_a^(a+epsilon) phi'(x) (f(x) - f(a)) dif x)\
  &<= abs((1-phi(a+epsilon)) f(a)) + delta abs(integral_a^(a+epsilon) phi'(x) dif x)\
  &<= 1/k f(a) + delta $
同理：
$ abs(integral_b^(b-epsilon) phi'(b) f(x) dif x + f(b)) <= 1/k f(b) + delta $

因此：
$ abs(integral_a^b phi' f dif x - (f(a) - f(b))) <= (f(a)+f(b))/k + 2 delta + (2norm(f)_1)/(k(b-a)) $

因此，利用弱导数定义，有：
$ abs(integral_a^b D_w^1 f(x) dif x - (f(b) - f(a))) &<=abs(integral_a^b D_w^1 f(x) dif x - integral_a^b D_w^1 f phi(x) dif x) \
  & quad + abs(integral_a^b phi' f dif x - (f(a) - f(b)))\
  &<= (f(a)+f(b))/k + 2 delta + (2norm(f)_1)/(k(b-a)) + (b-a)/k norm(D_w^1 f(x))_1 $
中令 $delta -> 0, k->oo$ ，并利用$f in W_1^1 => norm(D_w^1 f(x))_1 < oo, norm(f) < oo$ 可得：
$ integral_a^b D_w^1 f(x) dif x = f(b) - f(a) $


== 1.x.20

Prove Sobolev's inequality in the case of $n = 1$, i.e. that $Omega = [a, b]$ and show that
$ norm(u)_(L^oo (Omega)) <= C norm(u)_(W^1_1 (Omega)) $

Proof: 我们先考虑 $u in C^oo [a,b] sect W_1^1[a,b]$ 的情况，
因为
$ u(x) = u(a) + integral_a^x u'(t) dif t $
那么：
$ abs(u(x)) <= abs(u(a)) + integral_a^x abs(u'(t)) dif t <= abs(u(a)) + norm(u')_1 $
上面的式子对于所有的$a$都是成立的，而：
$ norm(u)_1 = integral_a^b abs(u) dif x >= (b-a) inf_(a <= x <= b) abs(u(x)) $
从而
$ forall x in [a, b], quad abs(u(x)) <= 1/(b-a) norm(u)_1 + norm(u')_1 $
令 $C = max {(b-a)^(-1), 1}$
那么$ norm(u)_oo = sup_(x in [a,b]) <= C (norm(u)_1 + norm(u')_1)$

我们还需要证明，对于 $u in W_1^1$ 都是成立的：

因为 $C^oo [a,b] sect W_1^1 [a,b]$ 在 $W_1^1[a,b]$ 内稠密，所以$forall u in W_1^1 [a,b]$，存在序列$C^oo [a,b] in.rev u_n -> u$

同时，考虑到 
$ norm(u_m - u_n)_oo <= C (norm(u_m - u_n)_1 + norm(u_m ' - u_n ')_1) = C norm(u_m - u_n)_(W_1^1) -> 0 quad (n, m -> oo) $

那么由$L^oo$的完备性可知，$u_n -> u in L^oo$这说明了，
$ norm(u)_(L^oo (Omega)) = lim_(n->oo) norm(u_n)_oo <= C lim_(n->oo) norm(u_n)_(W_1^1 (Omega)) = C norm(u)_(W_1^1 (Omega)) $

== 1.x.21

Let $Omega =[a, b]$. Prove that all functions in $W_1^1 (Omega)$ are continuous (have a continuous representative).

*Prove:*

沿用上一题的 $W_1^1(Omega)$中的$u_n -> u$，那么 
$ norm(u_n - u)_(L^oo) <= C norm(u_n - u)_(W_1^1) -> 0 quad (n -> oo) $

我们还能说明，由于 $u_n in C^oo [a,b]$，所以：
$ "ess" sup_x abs(u_n - u_m) = sup abs(u_n - u_m) $

那么 $sup abs(u_n - u_m) -> 0 quad (n, m -> oo)$，而 $C[a,b]$ 按 $sup abs(f)$ 是完备的，所以 $u_n -> u in C [a, b]$

== 1.x.30

Suppose $Omega$ is as in Proposition 1.6.3, and let $p$ be an real number in the range $1 <= p <= oo$. Prove that there is a constant $C$ such that

$ norm(v)_(L^p (diff Omega)) <= C norm(v)_(L^p (Omega))^(1- 1/p) norm(v)_(W_p^1 (Omega))^(1/p), quad forall v in W_p^1 (Omega) $
Explain what this means in the case $p = oo$.

Proof: 考察极坐标表达的$v (r, theta)$，不妨设$v>=0$，

$ 1/q = 1- 1/p => p/q = p - 1 => p = p/q + 1 $ 

$ v(1, theta)^p &= (r^2 v(r, theta)^p)|^1_0\
  &= integral_0^1 (diff)/(diff r) (r^2 v(r, theta)^(p/q + 1)) dif r\
  &= integral_0^1  2( r v^((p/q)+1) + p/q r^2 v^(p/q) (diff v)/(diff r)) dif r\
  &= integral_0^1 2( r v^((p/q)+1) + p/q r^2 v^(p/q) (nabla v) dot ((x, y))/r)(r, theta) dif r\
  &<= integral_0^1 2( v^(p/q + 1) + p norm(nabla v) v^(p/q)) r dif r $

再对 $theta$ 积分，并令 $C = max{2, 2p}, q= 1 - 1/p$

$ integral_(diff Omega) v^p dif x &= integral_0^(2 pi) v(1, theta)^p dif theta\
  &<= integral_0^(2 pi) integral_0^1 2(v^(p/q + 1) + p norm(nabla v) v^(p/q)) r dif r\
  &<= integral_Omega C v^(p/q) (v + norm(nabla v)) dif x\
  &<= C (integral_Omega v^p dif x)^(1/q) (integral_Omega (v + norm(nabla v))^p dif x)^(1/p) \
  &<= C (integral_Omega v^p dif x)^(1/q) (integral_Omega 2^(p-1) (v^p + norm(nabla v)^p) dif x)^(1/p) quad ("Jensen Inequality")\
  &<= 2 C norm(v)_p^(p/q) norm(v)_(W_p^1) quad ("Holder Inequality") $

即对 $p<oo$：
$ norm(v)_(L^p (diff Omega)) <= C norm(v)_(L^p (Omega))^(1- 1/p) norm(v)_(W_p^1 (Omega))^(1/p), quad forall v in W_p^1 (Omega) $

而因为我们考虑的是单位球，即有$0< m(Omega) < oo, 0 < m(diff Omega) < oo$，在这种情况下
$ norm(v)_(L^oo (diff Omega)) = lim_(p->oo), quad norm(v)_(L^p (diff Omega)) norm(v)_(L^oo (Omega)) = lim_(p->oo) norm(v)_(L^p (Omega)) $
因此该定理对 $p = oo$ 成立。