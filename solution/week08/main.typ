#set text(font: "Noto Sans CJK SC")

= Week 8
SA23001071 杨哲睿

1. Brenner教材，第67页，习题2.x.6
2. Brenner教材，第67页，习题2.x.7
3. Brenner教材，第67页，习题2.x.8
4. Brenner教材，第67页，习题2.x.9
5. Brenner教材，第67页，习题2.x.10
6. Brenner教材，第67页，习题2.x.12
7. Johnson教材，第63页，2.3
8. Johnson教材，第63页，2.5
9. Johnson教材，第64页，2.7

== 2.x.6

Prove the claim in Remark 2.5.11: 

In the symmetric case, $u_h$ minimizes the quadratic functional:
$ Q(v) = a(v, v) - 2 F(v) $
over all $v in V_h$

Proof:  因为$a(u, v) = F(v) quad forall v in V_h$

$ Q(v) - Q(u_h) &= a(v, v) - 2 F(v) - a(u_h, u_h) + 2 F(u_h)\
  &= a(v, v) - a(u_h, u_h) + 2 F(u_h - v)\
  &= a(v, v) - a(u_h, u_h) + 2 a(u_h, u_h - v)\
  &= a(v, v) + a(u_h, u_h) + 2 a(u_h, v) $

因为在对称的情况下，有$a(u, v) = a(v, u)$成立，因此上式可以写为：
$ Q(v) - Q(u_h) = a(u_h-v, u_h-v) >= 0 => Q(v) >= Q(u_h) quad forall v in V_h $

因此$u_h$最小化了$Q(v)$

== 2.x.7

Prove that a contraction mapping is always continuous.

Proof: 设 $T$ 为Banach空间$VV$上的压缩映射，存在 $0 <= k < 1$ 使得：
$ norm(T x - T y) <= k norm(x - y) quad forall x, y in VV $

设 $x_n -> x$ 为 $VV$ 中的收敛列，那么：
$ norm(T x_n - T x) <= k norm(x_n - x) -> 0 quad (n -> oo) $
即有：$T x_n -> T x quad (n -> oo)$

因此 $T$ 是连续的。

== 2.x.8

Prove that the mapping $u -> A u$ in the proof of the Lax-Milgram is a linear map $V -> V'$.

Proof: 验证 $A$ 是线性映射即可。

设 $u, v in V$，那么：

$ A(u + v) = a(u + v, ·) = a(u, ·) + a(v, ·) = A u + A v $

设 $u in V$，$alpha in RR$，那么：

$ A(alpha u) = a(alpha u, ·) = alpha a(u, ·) = alpha A u $

因此 $A$ 是线性映射。

== 2.x.9

Prove that the solution $u$ guaranteed by the Lax-Milgram Theorem satisfies

$ norm(u)_V <= 1/alpha norm(F)_(V')  $

Proof: 由Lax-Milgram定理可知，存在唯一的 $u in V$ 使得：
$ a(u, v) = F(v) quad forall v in V $
$ alpha norm(u)^2 <= a(u, u) = F(u) <= norm(F)_(V') norm(u)_V $

因此：
$ norm(u)_V <= 1/alpha norm(F)_(V') $

== 2.x.10

For the differential equation 
$ −u'' + k u' + u = f $
find a value for k such that $a(v,v) = 0$ but $v equiv.not 0$ for some $v ∈ H^1(0, 1)$

Proof: 在这种情况下：

$ a(u, v) = integral_0^1 (u' v' + k u' v + u v) dif x $
因此：
$ a(u, u) = integral_0^1 (u' (u' + k u) + u^2) dif x $

令 $u(x) = x$，那么：

$ a(u, u) = integral_0^1 ((1 + k x) + x ^2) dif x = 1/2 + k/2 + 1/3 $

令 $k = -5/3$，那么：

$ a(u, u) = 0 $

因此 $k = -5/3$ 时，$a(v, v) = 0$ 但 $v equiv.not 0$。

=== 2.x.12

Let $a(u, v) = integral_0^1 (u' v' + u'v + u v) dif x$ and $V = {v in W_2^1 (0, 1): v(0) = v(1) = 0}$.

Prove that $a(u, v) = integral_0^1 (v')^2 + v^2 dif x$ forall $v in V$.

Proof: 首先考虑 $v in C^oo$， $v(0) = v(1) = 0$，那么：
$ integral_0^1 v' v dif x = 1/2 integral_0^1 dif v^2 = 1/2 v(1)^2 - v(0)^2 $

$ a(v, v) &= integral_0^1 (v' v' + v' v + v v) dif x \
  &= integral_0^1 (v')^2 + v^2 dif x $

我们再考虑 $v in V$ 的情况，由$C^oo (Omega) sect W_1^2$ 在 $W_1^2$ 中的稠密性可知，存在$c_n -> v$ 那么：
$ abs(a(c_n, c_n) - a(v, v)) &= abs(a(c_n, c_n) - a(c_n, v) + a(c_n, v) - a(v, v)) \
  &<= C (norm(c_n) + norm(v)) norm(c_n - v) -> 0 quad (n -> oo) $

对于 $integral_0^1 (u')^2 + u^2 dif x$ 也是类似的，因此：

$ a(v, v) = integral_0^1 (v')^2 + v^2 dif x $

== 2.3

Give a variational formulation of the problem:
$ u_(x x x x) = f\
  u(0) = u''(0) = u'(1) = u'''(1) = 0 $
and show that the conditions are satisfied. Which boundary conditions are essential and which are natural? 
What is the interpretation of the boundary conditions if $u$ represents the deflection of a beam?

选取空间$VV = { u in H^2: u(0) = 0, u'(1) = 0 }$，定义如下的：

// $ integral f v dif x = integral u'''' v dif x &= u''' v |^1_0 - integral u''' v' dif x\
//   &= u''' v|^1_0 - u'' v'|^1_0 + integral_0^1 u'' v'' dif x $

$ a(u, v) = integral_0^1 u'' v'' dif x $

$ f(v) = integral_0^1 f dot v dif x $

变分问题为，$VV = { u in H^2: u(0) = u'(1) = 0}$，使得：
$ a(u, v) = f(v) $
对于 $v in VV$ 都成立。

验证对称性：

$ a(u, v) = integral_0^1 u'' v'' dif x = integral_0^1 v'' u'' dif x = a(v, u) $

验证连续性：

$ a(u, v) = integral_0^1 u'' v'' dif x \
  <= norm(u'')_(L^2) norm(v'')_(L^2) \
  <= norm(u)_(H^2) norm(v)_(H^2) $

验证椭圆性：

$ u'(1) = 0 => |u'(x)| <= integral_0^1 |u''| dif x <= (integral_0^1 dif x)^(1/2) (integral_0^1 |u''| dif x)^(1/2) 
=> |u'(x)|^2 <= norm(u'')^2_2 $

因此： $ norm(u')_2^2 <= integral_0^1 norm(u'')^2_2 dif x = norm(u'')^2_2 => norm(u')_2 <= norm(u'')_2 $
同理有：$norm(u)_2 <= norm(u')_2 <= norm(u'')_2$
对于：
$ a(u, u) = integral_0^1 (u'')^2 dif x = norm(u'')_2^2 >= 1/3 norm(u)^2 $

因此条件都是满足的。

== 2.5

Give a variational formulation of the inhomogeneous Neumann problem:

$ cases(-laplace u + u = f quad & "in" Omega, (diff u)/(diff n) = g & "on" Gamma ) $

and check if the conditions are satisfied.

双线性形式：
$ a(u, v) = integral_Omega nabla u dot nabla v + u v dif x $

线性泛函：
$ f(v) = integral_Gamma v g dif S + integral_Omega f v dif x $

选取空间为$VV = H^1 (Omega)$

那么变分问题为，找到 $u in VV$，使得$forall v in VV, a(u, v) = f(v)$

验证对称性：
$ a(u, v) = integral_Omega nabla u dot nabla v + u v dif x = integral_Omega nabla v dot nabla u + u v dif x = a(v, u) $

验证有界性：
$ a(u, v) = integral_Omega nabla u dot nabla v + u v dif x <= norm(u)_(H^1) norm(v)_(H^1) $

验证椭圆性：
$ a(u, u) = integral_Omega (nabla u)^2 + u^2 dif x = norm(u)_(H^1)^2 $

验证$f$ 的连续性：
$ f(v) &= integral_Gamma v g dif S + integral_Omega f v dif x \
  &<= norm(v)_(L^2(Gamma)) norm(g)_(L^2(Gamma)) + norm(v)_(L^2(Omega)) norm(f)_(L^2(Omega))\
  &<= C norm(v)_(L^2 (Omega))^(1/2) norm(v)^(1/2)_(H^1 (Omega)) norm(g)_(L^2(Gamma)) + norm(v)_(H^1(Omega)) norm(f)_(L^2(Omega))\
  &<= (C norm(g)_(L^2(Omega)) + norm(f)_2) norm(v)_(H^1 (Omega)) $

因此条件都是成立的。

== 2.7

Eq.2.27:
$ a(u, v) = L(v)\
  a(u, v) = integral_Omega k(x) nabla u dot nabla v dif x\
  L(v) = integral _ Omega f v dif x + integral_(Gamma_2) g v dif S $

原问题的解是变分问题的解：
对于任意的$v in VV$，一方面：

#math.equation(numbering: "(1)", block: true)[ $integral_Omega - k(x) laplace u v dif x &= integral_(Omega_1) - chi_1 v laplace u dif x + integral_(Omega_2) - chi_2 v laplace u dif x\
  &= integral_(Omega_1) chi_1 nabla u dot nabla v dif x + integral_(Omega_1) chi_2 nabla u dot nabla v dif x \
  &quad quad- integral_(diff Omega_1) chi_1 v (diff u)/(diff n) dif S - integral_(diff Omega_2) chi_2 v (diff u)/(diff n) dif S\
  &= integral_Omega k(x) nabla u dot nabla v dif x - integral_(Gamma_2) v q dot n dif x - integral_S v(chi_1 (diff u_1)/(diff n) - chi_2 (diff u_2)/(diff n)) dif S$ ]<base>
另一方面：
$ integral_Omega - k(x) laplace u v dif x = integral_Omega f v dif x $
那么：
$ integral_Omega k(x) nabla u dot nabla v dif x - integral_S v(chi_1 (diff u_1)/(diff n) - chi_2 (diff u_2)/(diff n)) dif S
  = integral_(Gamma_2) v q dot n dif x + integral_Omega f v dif x $
即：
$ a(u, v) - integral_S v(chi_1 (diff u_1)/(diff n) - chi_2 (diff u_2)/(diff n)) dif S
  = L(v) quad forall v in VV $

由$S$ 上的条件可知：
$ a(u, v) = L(v) quad forall v in VV $

因此$u$ 是变分问题的解。另一方面，设 $u$ 是变分问题的解，因为$u|_(Gamma_1) = 0$,所以 @base 还是成立的。同时 $forall v in VV$：

$ integral_(Omega) k(x) nabla u dot nabla v dif x = integral_Omega f v dif x + integral_(Gamma_2) v g dif S $

那么：

$ integral_Omega v(f + k(x) laplace u) dif x + integral_(Gamma_2) v(q dot n - g) dif S - integral_S v (chi_1 (diff u_1)/(diff n) - chi_2 (diff u_2)/(diff n)) dif S = 0 $

取$VV$中任意的在$Omega_1$内具有紧支集的函数$v$，那么：

$ integral_(Omega_1) chi_1 (f + chi_1 laplace u) dif x = 0 quad forall v in VV, v|_(Omega - Omega_1) equiv 0 => f + chi_1 laplace u = 0 "in" Omega_1 $

同理，在$Omega_2$ 内也有$f + chi_2 laplace u = 0$

那么：

$  integral_(Gamma_2) v(q dot n - g) dif S - integral_S v (chi_1 (diff u_1)/(diff n) - chi_2 (diff u_2)/(diff n)) dif S = 0 $

取特殊的 $v in VV_0$ 使得 $v|_(diff Omega) = 0$，那么：
$ integral_S v (chi_1 (diff u_1)/(diff n) - chi_2 (diff u_2)/(diff n)) dif S = 0 quad forall v in VV_0 $
从而：
$ chi_1 (diff u_1)/(diff n) - chi_2 (diff u_2)/(diff n) = 0 $
因此：
$ integral_(Gamma_2) v(q dot n - g) dif S = 0 quad forall v in VV => q dot n = g "on" Gamma_2 $

因此变分问题的解是原问题的解。


