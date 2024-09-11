= 4.1

Let $I = [0, h]$ and let $pi v in P_1(I)$ be the linear interpolant that agrees with $v in C^0(I)$ at the end points of 
$I$. Using the technique of the proof of Theorem 4.1 prove estimates for $norm(v - pi v)_oo$ and $norm(v' - (pi v)')_oo$
cf 1.12 and 1.13.

Proof: 设 $v in W_oo^2(I)$，即 $v$ 存在2阶弱导数。我们对于其进行Taylor展开：

$ v(y) = v(x) + v'(x) (y - x) + R(x, y) $

其中 $R(x, y) = 1/2 v''(xi) (y-x)^2 <= 1/2 h^2 |v''(xi)|$，因此可以得到其与半范数的关系：

$ |R(x, y)| <= 1/2 h^2 ||D^2 v||_(oo) $

同时，用 $y = 0, 1$ 分别代入：

$ v(0) = v(x) + v'(x)(- x) + R(x, 0), v(h) = v(x) + v'(x) (h - x) + R(x, 1) $

$pi v$ 是 $v$ 在 $I$ 上的线性插值, 则有
$ pi v (x) &= v(0) (h - x)/h + v(h) x/h\
  &= v(x) + v'(x) ((h-x)/h (-x) + (h-x) x/h) + (h-x)/h R(x, 0) + x/h R(x, 1)\
  &= v(x) + (h-x)/h R(x, 0) + x/h R(x, 1) $

因此：
$ v(x) - pi v(x) = - 1/2((h-x)/h x^2 |v''(xi)| + x/h (h - x)^2 |v''(eta)|) $

因此：
$ norm(v - pi v)_oo &= sup_x abs(1/2((h-x)/h x^2 |v''(xi)| + x/h (h - x)^2 |v''(eta)|)) \
  &<= 1/2 ((h - x)/h x^2 + x/h (h - x)^2) norm(D^2 v)_oo\
  &<= 1/8 h^2 norm(D^2 v)_oo $
同时：
$ (pi v)' (x) = (v(h) - v(0))/h = v'(x) + 1/h (R(x,1) - R(x, 0)) $
那么：
$ |(v - pi v)'| = 1/h abs(R(x, 1) - R(x, 0)) <= h ||D^2 v||_(oo) $

因此： $norm((v-pi v) ')_oo <= h norm(D^2 v)_oo$

= 4.3

Estimate the error $norm(u - u_h)_(H^2 (I))$ for problem 1.5 and example 2.4.

$ (dif^4 u)/(dif x^4) = f, u(0) = u'(0) = u(1) = u'(1) = 0 $

变分问题：Find $u in H^2, u(0) = u'(0) = u(1) = u'(1) = 0$ s.t. $a(u, v) = (f, v)$，$forall v in H^2, v(0) = v(1) = v'(0) = v'(1) = 0$

假设变分问题的解 $u in H^3, pi u in H^2$，其中 $pi u$ 为 $u$ 的分段2次Hermite插值，满足：

$ pi u (x_i) = u (x_i), quad (pi u)'(x_i) = u' (x_i) $

一维的空间划分为：
$ I = [a,b] => a = x_0 < x_1 < ... < x_N = b $

其中 $h = max_i x_(i+1) - x_i$

先考虑 $[0, 1]$ 上的情况，即 $hat(e)(lambda) := e(x) = e(lambda(x_(i+1) - x_i) + x_i), e(x) = u(x) - pi u(x)$

该函数满足：
$ hat(e)'(0) = hat(e)'(1) = hat(e)(0) = hat(e)(1) = 0 $
根据嵌入定理，$u in H^3 => u in C^2 => hat(e) in C^2$，因此，$exists lambda_0, hat(e)''(lambda_0) = 0$
$ |hat(e)''(lambda)| <= integral_(lambda_0)^lambda |e'''(tau)| dif tau<= integral_(0)^1 |hat(e)'''(tau)| dif tau <= 1 dot (integral_0^1 (hat(e)''')^2 dif tau)^(1/2) $

因此：
$ norm(hat(e)'')_(L^2[0,1])^2 <= integral_0^1 (integral_0^1 (hat(e)''')^2 dif tau) dif lambda = norm(hat(e)''')_(L^2[0,1])^2 $
同理，对于 $e, e', e''$ 间也有类似的关系，那么：
$ norm(hat(e))_(L^2[0,1]) <= norm(hat(e)')_(L^2[0,1]) <= norm(hat(e)'')_(L^2[0,1]) <= norm(hat(e)''')_(L^2[0,1]) $

转换回到 $x$ 所属的空间：

$ e(x) = hat(e)(lambda) => (dif e)/(dif x) = 1/h hat(e)'(lambda) $

因此：

$ integral_(x_i)^(x_(i+1)) e(x)^2 dif x &=  h integral_0^1 hat(e)(lambda)^2 dif lambda <= h norm(hat(e)''')_(L^2[0,1])^2 \
  integral_(x_i)^(x_(i+1)) e'(x)^2 dif x&= h^(-1) integral_0^1 hat(e)'(lambda)^2 dif lambda <= h^(-1) norm(hat(e)''')_(L^2[0,1])^2 \
  integral_(x_i)^(x_(i+1)) e''(x)^2 dif x&= h^(-3) integral_0^1 hat(e)''(lambda)^2 dif lambda <=h^(-3) norm(hat(e)''')_(L^2[0,1])^2 \
  integral_(x_i)^(x_(i+1)) e'''(x)^2 dif x&= h^(-5) integral_0^1 hat(e)'''(lambda)^2 dif lambda = h^(-5) norm(hat(e)''')_(L^2[0,1])^2 $

// $ integral_(x_i)^(x_(i+1)) e(x)^2 dif x &=  h integral_0^1 hat(e)(lambda)^2 dif lambda <=h integral_0^1 hat(e)'(lambda)^2 dif lambda \
// &= h integral_(x_i)^(x_(i+1)) h^2 e'(x)^2 1/h dif x <=h^2 integral_0^1 (hat(e)')^2 dif x $

可得：
$ integral_(x_i)^(x_(i+1)) e(x)^2 + e'(x)^2 + e''(x)^2 dif x &<= (h+h^(-1) + h^(-3)) h^(5) (integral_(x_i)^(x_(i+1)) e'''(x)^2 dif x)\
  &= h^2 (1 + h^2 + h^4) (integral_(x_i)^(x_(i+1)) e'''(x)^2 dif x) $

对 $i$ 求和，并且不妨设$h < 1$：
$ norm(e)_(H^2)^2 <= C h^2 integral_0^1 e'''(x)^2 dif x= C h^2 abs(x)_(H^3[0,1]) $
因为 $pi u$ 是二次的，$e''' = u'''$，代入$e = u - pi u$，并利用Céa引理：
$ norm(u - u_h)_(H^2) <= norm(u - pi u)_(H^2) <= norm(u - pi u)_(H^2) <= C h abs(u)_(H^3[0,1]) $





