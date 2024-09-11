#set text(font: "Noto Sans CJK SC")

== 3.x.1

Let $m$ and $k$ be non-negative integers and let $P$ be a polynomial in one variable of degree $2m + k + 1$. Suppose that
$P^(j) (a) = 0$ for $a = 0, 1$ and $j = 0, ..., m$ and further that $P(xi_j) = 0$ for $0 < xi_1 < ... < xi_k < 1$

Proof: 这样的条件说明了：

1. $x^(m+1)$ 是它的因式
2. $(x-1)^(m+1)$ 是它的因式
3. $(x - xi_j), j = 1...k$ 是它的因式

因此：

$ P = C(x) x^(m+1) (x-1)^(m+1) product_(j=1)^k (x - xi_j) $

其中 $x^(m+1) (x-1)^(m+1) product_(j=1)^k (x - xi_j)$ 是一个多项式，次数为$2m + k +2$，而$P$的次数为$2m+k+1 < 2m+k+2$，因此：
$ C equiv 0 $
那么 $P equiv 0$

== 3.x.8

Let $K$ be any rectangle. There exist constants $c_j^i$ such that for $phi in cal(P)_3$, $phi(w_i) = sum_(j=1)^12 c_j^i phi(z_j)$ for $i = 1, 2, 3, 4$
then let
$ cal(P) = {phi in cal(Q)_3: phi(w_i) - sum_(j=1)^12 c_j^i phi(z_j) = 0, i = 1,2,3,4} $
and $cal(N)$ as depicted.
Then $(cal(K\, P\, N))$ is a finite element.

#figure(image("3x8.png", width: 50%))

*Proof: * $c_j^i$ 存在性的证明：设 $N_i phi = phi(z_i)$ $i = 1,2,...,12$ 那么 $N_i in cal(P)_3 '$，假设 $phi in cal(P)_3$ 使得
$ N_i phi = 0, quad i = 1,2,...,12 $
那么：$phi = C (x^2 - 1) (y^2 - 1)$ 但因为 $phi$ 是 $cal(P)_3$ 的元素，因此 $C = 0, phi equiv 0$。
这说明了 $"span"{ N_i} = cal(P)_3 '$，因此 $N in cal(P)'_3, N: phi |-> phi(w_j)$ 可以表示为 $N_i$ 的线性组合，即 $exists c_j^i$
使得 $ phi(w_i) = sum_j c_j^i  phi(z_j) $
这说明了题目中的常数$c_j^i$是存在的。

*插值的唯一可解性*：设$phi in cal(Q)_3, phi(z_j) = 0, j = 1...12$
因为$phi(w_i) = sum_(j=1)^12 c_j^i phi(z_j) = 0$，因此$phi(x)$ 在这12个点上都为 $0$，

考虑其限制到 $x = 1, x = -1, x = 1/3, x = - 1/3$ 上，在这些直线上，都是三次多项式，因此 $phi(x, y) = C (x^2-1) (x^2 - 1/9)$。然而
$phi in cal(Q)_3$ 因此 $C = 0$，这说明 $phi equiv 0$，因此其具有唯一可解性。

*连续性*：对于邻接的两个三角形，其在边界上是一个单变量的三次多项式，这个三次多项式有四个重合点，因此在边界上的不同元的插值函数是相等的。
因此这个插值具有 $C^0$ 连续。

== 3.x.11

Prove that the set of nodal variables:
$ Sigma_n = {P(a), P'(a), P^((3))(a), ..., P^((2n-1))(a): a = 0, 1} $
determine unique polynomials (in one variable) of degree $2n + 1$.

Proof: 设 $P(x) = a_0 + a_1 x + ... + a_(2n + 1) x^(2n + 1)$，那么：

$ cases(P^((i)) (0) = i! a_i, 
  P^((i)) (1) = i! a_i + (i+1)! a_(i+1) + ((i+2)!)/(2!) a_(i+2) + ... + ((2n+1)!)/((2n+1-i)!) a_(2n+1)) $

一共有 $2n+2$ 个方程和$2n+2$个未知数，因此方程组一定是有解的，我们只需要证明，这个解是唯一的。

设 $P(x)$ 和 $Q(x)$ 都满足这个方程组，那么 $E(x) = P(x) - Q(x)$ 在 Nodal variables 上都为0.

因为：
$ E(0) = E'(0) = E'''(0) = ... = E^((2n-1)) (0) = 0 $
那么 $E = A_1 x^2 + A_2 x^4 + ... + A^n x^(2n)$

先考虑：
$ E^((2n-1))(0)= E^((2n-1))(1) = 0 => exists xi "s.t." E^((2n))(xi) = 0 => A^n = 0 $
再考虑：
$ E^((2n-3))(0) = E^((2n-3))(1) = 0 => exists xi "s.t." E^((2n-2)) (xi) = 0 => A^(n-1) = 0 $

以此类推，可知 $A^i = 0, space forall i$，那么 $E = 0$，即 $P equiv Q$，唯一性得证。

== Ex.1

写出三角形单元Lagrange型三次单元形状函数基函数，并证明插值的唯一可解性和连续性

#figure(image("ex1.png", width: 50%))

标号如上，基于面积坐标

$ N_1 = 9/2 lambda_2 (lambda_2 - 1/3) (lambda_2 - 2/3) $

$ N_2 = 27/2 lambda_3 (lambda_2 - 1/3) lambda_2 $

$ N_3 = 27/2 lambda_3 (lambda_3 - 1/3) lambda_2 $

$ N_4 = 9/2 lambda_3 (lambda_3 - 1/3) (lambda_3 - 2/3) $

$ N_5 = 27/2 lambda_3 lambda_1 (2/3 - lambda_1) $

$ N_6 = 27/2 lambda_3 (lambda_1 - 1/3) lambda_1 $

$ N_7 = 9/2 lambda_1 (lambda_1 - 1/3) (lambda_1 - 2/3) $

$ N_8 = 27/2 lambda_2 lambda_1 (lambda_1 - 1/3) $

$ N_9 = 27/2 lambda_2 lambda_1 (2/3 - lambda_1) $

$ N_10 = 27 lambda_1 lambda_2 lambda_3 $

插值的唯一可解性：

假设$P$在 10 个节点上都是$0$，将其限制到 1234, 4567, 7891这三个直线上，在直线上四个点三次函数是零，因此，
$P$ 有 $lambda_1 lambda_2 lambda_3$ 这个因式，$P = C lambda_1 lambda_2 lambda_3$，因为$P$是一个三次多项式，从而 C 是一个常数。

但是$P(1/3, 1/3, 1/3) = 0$，从而$C=0$，那么$P equiv 0$。因此插值有唯一可解性。

插值的连续性：

对于邻接的两个三角元，其在边界上是一个单变量的三次多项式，这个三次多项式有四个重合点，因此在边界上的不同元的插值函数是相等的。因此这个插值具有 $C^0$
连续性。

== Ex2

证明Hermite型矩形双三次单元形状函数的插值唯一性。

*Proof: * 矩形单元双三次 Hermite 插值的自由度是四个节点上的函数值，偏导数值，以及二阶混合偏导数值。

假设 $P(z) = P_x (z) = P_y (z) = P_(x y) (z) = 0$ 在四个节点上都成立，那么 $P$ 限制到在这条边上都是零，因此 $P$ 
有因式 $(x - x_i) (y - y_i)$，因此 $P = C (x^2 - 1) (y ^ 2 - 1)$，因为
$P_(x y) (1, 1) = 0$
那么 $ 0 = 4 C  => C = 0 $
因此 $P equiv 0$，因此插值有唯一可解性。 