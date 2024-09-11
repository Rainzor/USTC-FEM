// #set text(font: "Source Han Serif SC VF")

// #set par(linebreaks: "optimized")

= 作业

== 1

考虑二维两点边值问题 $P_(2 D)$

$ - laplace u = f&, quad "in" Omega \
  u = 0&, quad "on" Gamma $

其对应的变分问题($W_(2 D)$)：找到 $u in V$，满足

$ a(u,v) = (f, v) quad forall v in V $

极小化问题($M_(2 D)$)：找到 $u in V$

$ J(u) <= J(v) quad forall v in V $

=== (1) 写出 $J$ 和 $a$ 的表达式

$ a(u, v) = integral_Omega nabla u dot nabla v dif x $

$ J(u) = 1/2 a(u, u) - (f, u) $

$ V = H_0^1 $

=== (2) 证明等价性：

==== P $=>$ W

因为 
$ - laplace u = f&, quad "in" Omega \
  u = 0&, quad "on" Gamma $
那么：$forall v in V$,因为 $v|_(diff Omega) = 0$

$ (f, v) &= (- laplace, v)\
  &= integral_Omega nabla u dot nabla v dif x - integral_(diff Omega) v (diff u) / (diff n) dif S\
  &= integral_Omega nabla u dot nabla v dif x\
  &= a(u, v) $

因此原问题的解 $u$ 是变分问题的解。

==== W $=>$ M

$forall v in V$:

$ J(v) &= J(u + (v - u))\
  &= 1/2 a(u, u) + a(v - u, u) + a(v-u, v-u) - (f, v)\
  &= 1/2 a(u, u) + (f,-u) + a(v-u, v-u)\
  &>= J(u) $

因此 $u$ 是极小化问题的解。

==== M $=>$ W

$forall v in V$:考虑$epsilon$的函数$f$：

$ f(epsilon) = J( u + epsilon v) = 1/2(a(u, u) + 2epsilon a(u, v) + epsilon^2 a(v, v)) - (f, u + epsilon v) $

对 $epsilon$ 求导

$ f'(epsilon) = epsilon a(v, v) + a(u, v) - (f, v) $

因为 $J(u) <= J(v) quad forall v in V$ ，那么

$ f'(0) = a(u, v) - f(v) = 0 $

因为上式对 $forall v in V$ 成立，所以$u$也是变分问题的解。

==== W $=>$ P

因为 $u$ 充分光滑，并利用$v|_(diff Omega) = 0$，Green公式：

$ integral_Omega v (-laplace u) dif x = integral_Omega nabla u dot nabla v dif x $

$ 0 = a(u, v) - (f, v)= integral_Omega (-laplace u - f) v dif x $

假设 $exists x_0 in Omega$，使得 $laplace u + f > 0$ 对以 $x_0$ 为球心的 $B$恒成立，取 $v$为以$B$为支集的函数，在$B$内满足$v > 0$，那么：
$ integral_Omega (laplace u + f)v dif x = integral_B (laplace u + f) v dif x > 0 $

因此这样的 $x_0$ 不存在，从而 $u$ 是原方程的解。

== Brenner 0.x.9

Let $V$ denote the space, and $a(dot.c, dot.c)$ the binlinear form. Prove the following coercivity result
$ norm(v)^2 + norm(v')^2 <= C a(v, v) $
Give the value for $C$. (Hint: see the hint in 0.x.6. For simplicity, restrict the result to $v in V union C^1(0, 1)$)

Hint in 0.x.6: 若 $w(0) = 0, w in L^2(0, 1), a(w, w) < oo$，考虑 $w$ 的傅立叶变换：

$ w(t) = sum_(n=1)^oo a_n sin (n pi)/2 x $

那么：

$ integral_0^1 (w(t))^2 dif x = 1/2 sum_(n=1)^oo a_n^2 $

考虑 $w'$ 的傅立叶变换：

$ w'(t) = sum_(n=1)^oo a_n (n pi) / 2 cos (n pi) / 2 x $

那么：

$ integral_0^1 (w'(t))^2 dif x = 1/2 sum_(n=1)^oo (a_n (n pi)/2)^2 $

公式 $integral_0^1 w(t)^2 dif x <= c integral_0^1 w'(t)^2 dif x$ 中的 $c$ 在：$a_1 = 1, a_n = 0 quad(n>=2)$时取最大值：$c = 4/(pi^2)$

因此：$ integral_0^1 w(t)^2 dif x <= 4/(pi^2) integral_0^1 w'(t)^2 dif x $

即 $norm(w)^2 <= 4/(pi^2) norm(w')^2$

*Proof:*  $V = {v in L^2(0, 1): a(v, v) < oo "and" v(0) = 0}$，

$ a(v, v) = integral_0^1 v'(t)^2 dif t = norm(v')^2 $
那么：
$ norm(v)^2 + norm(v')^2 <= (1+ 4/(pi^2)) a(v, v) $
即 $C = 1 + 4/pi^2$

== Brenner 0.x.10

Let $V$ denote the space, and $a(dot.c, dot.c)$ the binlinear form. Prove the following version of sobolev's inequality:
$ norm(v)^2_max <= C a(v, v) $
Give the value for $C$. (Hint: see the hint in 0.x.6. For simplicity, restrict the result to $v in V union C^1(0, 1)$)

*Proof:* 因为$(sup abs(v))^2 = sup v^2$，利用 Cauchy不等式：

$ v(t) &= integral_0^t v'(x)  dif x \
  &= integral_0^t 1 dot v'(x)  dif x\
  &<= sqrt(t) sqrt(integral_0^t v'(x)^2 dif x) $

那么：
$ v(t)^2 <= t integral_0^t v'(x)^2 dif x $

两边同取上确界：
$ sup v^2 <= sup (t integral_0^t v'(x)^2 dif x) <= integral_0^1 v'(x)^2 dif x $

因此：

$ norm(v)_max^2 <= a(v, v) quad forall v in V $

即题目中常数 $C=1$，取 $v(x) = x$ 可使上式成立。

== Johnson 1.7

Formulate a difference method for 1.16 in the case when $Omega$ is square
$ cases(
  - laplace &u &= f & quad "in" Omega,
  &u &= 0 & quad "on" Omega
) $
 using the difference approximation
$ (diff^2 u)/(diff x_1^2) ~ (u(x_1 + h, x_2) - 2 u(x_1, x_2) + u(x_1 - h, x_2)) / h^2 $
and a corresponding approximation for $(diff^2 u)/(diff x_2^2)$. Compare with example 1.1.

在这一题，我们沿用 Example 1.1 的记号。对于非边界点$i$，利用上述公式：

$ (diff^2 u)/(diff x_1^2) approx (u_(i+N) + u_(i-N) - 2 u_(i)) / h^2 $
$ (diff^2 u)/(diff x_1^2) approx (u_(i+1) + u_(i-1) - 2 u_(i)) / h^2 $

泊松方程改写为差分方程如下：

$ -((u_(i+N) + u_(i-N) - 2 u_(i)) / h^2 + (u_(i+1) + u_(i-1) - 2 u_(i)) / h^2) = f(x_i) $

简化为：

$ -u_(i+1) + 4 u_i - u_(i-1) - u_(i-N) - u_(i+N) = h^2 f(x_i) $

假设 $f(x)$ 充分光滑，那么有限元法中，方程组右端的 $b_i$ 可以近似为：
$ b_i = integral phi_i f(x) dif x = h^2 (f(x_i) + O(h)) $

观察差分方程获得的方程组和右端项，可以发现在这种近似的情况下，两个方法获得的方程组是相同的。

#figure(
  image("jh17.png", width: 70%),
  caption: [Example 1.1]
)

== Johnson 1.15

Prove that (1.35) and (1.36) are equivalent (cf the proof of theorem 1.1).

#let ip(x, y)=[$angle.l #x, #y angle.r$]

1.35:
#math.equation(block: true)[
  $ip(u - u_h , v) = 0 quad forall v in V_h$
]

1.36:
#math.equation(block: true)[
  $norm(u - u_h)_(H^1(Omega)) <= norm(u - v)_(H^1(Omega)) quad forall v in V_h$
]

*Proof:* 1.35 $=>$ 1.36: $forall v in V_h, u_h - v in V_h$
那么：
$ ip(u - u_h, u_h - v) = 0 $

因此：

$ norm(u - v)_(H^1)^2 &= ip(u-v, u-v)\
  &= ip(u-u_h + u_h - v, u-u_h + u_h - v)\
  &= ip(u-u_h, u-u_h) + ip(u-v, u-v)\
  &>= norm(u-u_h)_(H^1) $

因此1.36成立。下证1.36$=>$1.35，$forall v in V_h$，定义如下的函数：

$ f(epsilon) = norm(u - u_h + epsilon v)_(H^1) $

因为1.36成立，所以 $f'(0) = 0$，立刻得到：

$ ip(u - u_h, v) = 0 $

即 1.35成立。综上1.35与1.36等价。

== Johnson 1.16

Show that the problem

$ cases(
  -u'' = f,
  u(0) = u'(1) = 0
) $

can be given the follow variational formulation: Find $u in V$ such that
$ (u', v') = (f, v) quad forall v in V $
where $V = {v in H^1(I) : v(0) = 0}$. Formulate a Finite element method for this problem using piecewise linear functions. Determine the corresponding linear system of equations in the case of a uniform partition and study in particular how the boundary condition $u'(1) =0$ is approximated by the method.

*Solution:*

首先说明变分问题和原问题是等价的。若 $u$ 是原问题的解，那么 $forall v in V$：
$ (u', v') &= u'(1)v(1) - u'(0)v(0) - (u'', v)\
  &= (f, v) $
因此 $u$ 是变分问题的解。另一方面若 $u$ 是变分问题的解：
$ u'(1)v(1) = (u''+f, v) $
假设 $exists x_0, u''+f > 0$，若解是光滑的，那么存在区间 $[x_1, x_2]$ $u''+f >0 quad forall x_1 < x < x_2$

这说明，取
$ v = cases(
  -(x-x_1)(x-x_2) &quad x_1 < x < x_2,
  0 & quad "otherwise"
) $

有
$ 0 = u'(1)v(1) = (u''+f, v) > 0 $

因此 $(u''+f, v) = 0 quad forall v in V$，另外，取 $v(x) = x$，可得到 $u'(1) = 0$。所以变分问题的解是原问题的解。

下面描述其有限元解：取 $V_h = {v: v "为分片连续线性函数", v(0) = 0}$。有限元解为：找 $u_h in V_h$，使得
$ (u_h ', v_h ') = (f, v_h) quad forall v in V_h $


设 $0=x_0 < x_1 < dots < x_n < x_n=1, quad h = x_(i) - x_(i-1)$ 全局基函数为
$ phi_i=cases(
  (x-x_(i-1))/(x_i - x_(i-1)) & quad x_(i-1) <= x < x_i,
  (x_(i+1) -x)/(x_(i+1) - x_(i)) & quad x_(i) <= x < x_(i+1),
  0 & quad "otherwise"
), quad quad phi_n = cases(
  (x-x_(n-1))/(x_n - x_(n-1)) & quad x_(n-1) < x <= 1,
  0 & quad "otherwise"
) $

那么 $ u_h = sum_(i=1)^n u_h(x_i) phi_i $ 计算全局刚度矩阵：

$ (phi_i ', phi_i ') = 2/h, quad (phi_i ', phi_(i-1) ') = (phi_(i-1) ', phi_i ') = -1/h quad forall i < n $

对于 $i = n$：

$ (phi_n ', phi_n ') = 1/h, (phi_n', phi_(n-1) ') = - 1/h $

因此全局刚度矩阵为：

$ K = 1/h mat(
  2, -1, 0, dots.c, 0,0;
  -1, 2, -1, dots.c, 0, 0;
  0, -1, 2 , dots.c, 0, 0;
  dots.v, dots.v, dots.v, dots.down, dots.v, dots.v;
  0, 0, 0, -1, 2, -1;
  0, 0, 0, 0, -1, 1;
) $

$ f_i = (f, phi_i) approx 1/h f(x_i) quad f_n = (f, phi_n) approx 1/(2h) f(1) $

将节点值组合成向量：$U = (u_h(x_1), u_h(x_2), ..., u_h(x_n))^T$那么有限元法求解如下的线性方程组：

$ K U = F $

== 1.17
Show that the problem (M) and (V) of this section are equivalent.

(V): Find $u in H^1(Omega)$, s.t.
$ a(u, v) = (f, v) + <g,v> $
where $a(u, v) = integral_Omega (Delta u dot Delta v + u v) dif x$

(M): Find $u in H^1$ such that $F(u) <= F(v) quad forall v in H^1(Omega)$
where $ F(v) = 1/2 a(v, v) - (f, v)-<g,v> $

*Proof: * 假设 $u$ 是 (V) 的解，$forall v in V$，因为 $u - v in V$，那么：
$ a(u, u-v) = (f, u-v) + <g, u-v> $
那么：
$ F(v) &= F(u + (v - u)) =1/2 a(u, u) + 1/2 a(v-u, v-u) - (f, u)  - <g, u>\
  &= F(u) + 1/2 a(v - u, v - u)
  &>= F(u) $
因此 $u$ 是 (M) 的解。

假设 $u$ 是 (M) 的解，定义如下的函数
$ f(epsilon) = F(u+ epsilon v) $
因为 $F(u) <= F(v) space forall v in V $，所以$epsilon=0$是 $f$ 的极小点，即有 $f'(epsilon) = 0$，化简得到：
$ a(u, v) - (f, v) - <g, v> = 0 $
因此 $u$ 是 (V) 的解。

== 1.18

Let $Omega$ be a bounded domain in the plane and let the boundary $Gamma$ of $Omega$ be devided into two parts $Gamma_1$ and $Gamma_2$. Give a variational formulation of the following problem:
$ cases(
  laplace u = f & quad "in" Omega,
  u = u_0 & quad "on" Gamma_1,
  (diff u)/(diff n) = g & quad "on" Gamma_2
) $
where $f, u_0$ and $g$ are given functions. Then formulate a finite element method for this problem. Also give an interpretation of this problem in mechanics or physics.

*Solution: *

Varitional Formulation: Find $u in VV$, such that:
$ a(u, v) = (f, v) + <g, v> forall v in VV_0 $
where 
$ VV = {v in H^1: v|_(Gamma_1) = u_0 }, quad VV_0 = {v in H^1: v|_(Gamma_1) = 0} $
$ a(u, v) = integral_Omega nabla u dot nabla v dif x $
$ (f,v) = integral_Omega f v dif x $
$ <g,v> = integral_(Gamma_2) g v dif S $
then $forall v in VV_0$:
$ integral_Omega (-laplace u) v dif x &= integral_Omega nabla u dot nabla v dif x - integral_(Gamma_2) v (diff u)/(diff n) dif S $

设$u$为原问题的解：
$ integral_Omega f v dif x = integral_Omega (-laplace u) v dif x $
利用上式，有：
$ integral_Omega nabla u dot nabla v dif x = integral_Omega f v dif x + integral_(Gamma_2) g v dif S $
因此原问题的解是变分问题的解。

设 $u$ 是变分问题的解：
$ integral_Omega (-laplace u) v dif x = integral_Omega f v dif x + integral_(Gamma_2) g v dif S - integral v (diff u) / (diff n) dif S $
整理得：
$ integral_Omega (laplace u+ f) v dif x = integral_(Gamma_2) v (g - (diff u)/(diff n)) dif S $

$ integral_Omega (laplace u + f) v dif x = integral_(Gamma_2) v g dif S $

如果$u''+f$充分光滑，且在 $x_0 in Omega$ $laplace u+f >0$，那么存在 $v in VV_0$ 在 $v|_(diff Omega) = 0$ 使得
$ 0 = integral_Omega (laplace u + f) v dif x > 0 $
因此 $u''+f =0 space forall x in Omega$，且 $integral_Omega (laplace u + f) v dif x =0$。
这说明 $integral_(Gamma_2) v(g- (diff u)/(diff n)) dif S = 0 space forall v in VV_0$，同理可得 $g - (diff u)/(diff n) = 0$。

因此$u$也是原问题的解。这说明我们构造的变分问题和原问题的解是等价的。

FEM的构造如下。考虑 $VV_h := {v: v "为分片线性函数", v|_(Gamma_1) = u_0}, VV_(h 0)={v: v "为分片线性函数", v|_(Gamma_1) = 0}$，找 $u in VV_h, $ s.t.
$ a(u, v)=(f, v) + <g, v> quad forall v in VV_(h 0) $

物理解释为：设有线性弹性模型控制的材料，其构型空间为 $Omega$，定义$Omega$上的形变为将$x in Omega$形变到$n$维空间的$u(x)$。因为材料为线性材料，假设在构型空间的每一点有外力，那么其稳定状态的控制方程可以写为：
$ - laplace_x u(x) = f $
对于材料边界 $diff Omega$，一部分$Gamma_1$是固定边界，即有
$ u= u_0 quad "on" Gamma_1 $
另一部分为受给定负载（外力）的边界 $Gamma_2$，那么：
$ (diff u) / (diff n) = g quad "on" Gamma_2 $
即得到原本的定解问题。




