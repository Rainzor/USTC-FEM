== 3.1

Show that if $v in P_r (I) = {v: v(x) = sum_(i = 0) a_i x^i, x in I, "where " a_i in RR}$, the set of polynomials of 
degree at most $r$ on the interval $I$, and if $v$ vanishes at $r+1$ distinct points on $I$, then $v equiv 0$. Recall
that if $v in P_r (I)$ and $v(b) = 0$ for some $b in I$ then $v(x) = (x - b) w(x)$ where $w in P_(r-1) (I)$

Proof: 假设$v$在$x_i, i = 0, 1, ..., r$处，$v(x_i) = 0$ 都成立，那么：
$ p(x) = product_(i = 0)^(r) (x - x_i) $
是 $v(x)$ 的一个因式，即 $v(x) = w(x) p(x)$

但 $p(x)$ 是一个 $r+1$ 次的多项式，$v(x)$只是一个 $r$ 次的多项式，那么显然$w = 0$。即$v(x) equiv 0$

== 补充

证明Lagrange型矩形双二次单元形状函数插值的唯一可解性和连续性。

Proof：

对于 $[-1, 1] times [-1, 1]$ 单元，其上的矩形双二次单元形状函数一共有 9 个为：
$ phi_(i,j)(x, y) = L_i (x) L_j (y) quad i, j = -1, 0, 1 $

其中的：
$ L_(-1) = 1/2 x (x - 1), L_0 = 1-x^2, L_1 = 1/2 x (x+1) $

每个单元在 $(i, j) quad i,j=-1,0,1$ 处各有1个自由度，函数值为 $u_(i, j)$，那么对于一个单元上的插值函数为：

$ u(x, y) = sum_(i,j = -1)^(1)  u_(i, j) phi_(i, j)(x, y) $

唯一可解性：若 $u$ 满足
$ u(i, j) = 0 quad forall i, j = -1, 0, 1 $
那么：
$ mat(1, 0, 0 , dots.c, 0;
  0, 1, 0,dots.c, 0;
  0, 0, 1,dots.c, 0;
  dots.v, dots.v, dots.v, dots.down, 0;
  0, 0, 0, dots.c, 1)_(9 times 9) vec(u_(-1, -1), u_(-1, 0), dots.v, u_(1, 1)) = 0 $
左侧的矩阵就是单位阵，所以$u_(i, j)$只有零解，即$u(x, y) equiv 0$。

连续性：对于相邻的两个单元，其公共边界上，例如 $x = x_0$ 上的函数都是$y$的二次函数，但这两个函数有三个相同的点，所以这两个函数是相同的，
即函数在公共边界上是连续的。
