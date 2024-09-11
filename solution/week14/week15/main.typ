= 8.6

Proof:

(a) 因为 $f = 0$，

$ (U^n - U^(n-1), v) + k_n a(U^n, v) = 0 quad forall v in VV_h, n = 1,..., N $

$ (U^n, U^n) - (U^(n-1), U^(n-1)) &= (U^n + U^(n-1), U^n - U^(n-1))\
  &= -2 k_n a(U^n, U^n) + k_n a(U^n, U^n - U^(n-1))\
  &= -2 k_n a(U^n, U^n) - (U^n - U^(n-1), U^n - U^(n-1))\
  &<= 0 $

这说明了：
$ norm(U^n) <= norm(U^(n-1)) <= ... <= norm(u^0) $

(b) 左侧求和号内的表达式为：

$ k_n norm((U^n - U^(n-1)) / k_n)^2 &= - a(U^n, U^n - U^(n-1))\
  &= -(1/2 a(U^n + U^(n-1), U^n - U^(n-1)) + 1/2 a(U^n - U^(n-1), U^n - U^(n-1)))\
  &<= -1/2 a(U^n + U^(n-1), U^n - U^(n-1)) \
  &= -(1/2 a(U^n, U^n) - 1/2 a(U^(n-1), U^(n-1))) $

令 $a^n = a(U^n, U^n)$：

$ sum_(n=1)^N t_n k_n norm((U^n - U^(n-1)) / k_n)^2 &= - sum_(n=1)^N t^n (a^n - a^(n-1))\
  &= -t^n a^n + sum_(n=1)^(N-1) a^n (t^(n+1) - t^(n))\
  &= -t^n a^n + sum_(n=1)^(N-1) a^n k_n\
  &<= sum_(n=1)^(N-1) k_n a(U^n, U^n)\
  &= - sum_(n=1)^(N-1) (U^n - U^(n-1), U^n)\
  &= sum_(n=1)^(N-1) 1/2 (norm(U^n)^2 + norm(U^(n-1))^2) -norm(U^n)^2 \
  &= 1/2 norm(U^0)^2 - norm(U^N)^2 <= C norm(u^0)^2 $

因此：

$ (sum_(n=1)^N t_n k_n norm((U^n - U^(n-1)) / k_n)^2)^2 <= C norm(u^0) $

(c) 

$ (sum_(n=1)^N norm((U^n - U^(n-1))/ k_n)) ^2 &<= (sum_(n=1)^N t_n k_n norm((U^n - U^(n-1)) / k_n)) (sum_(n=1)^N k_n / t_n)\
  &<= C^2 norm(u_0)^2 (1 + sum_(n=2)^N k_n / t_n)\
  &<= C^2 norm(u_0)^2 (1 + sum_(n=2)^N C k_(n-1)/t_n )\
  &= C^2 norm(u_0)^2 (1 + integral_(I_(n-1)) 1/t dif t)\
  &= C^2 norm(u_0)^2 (1 + C log T/k_1)\
  &<= C (1 + log T/k_1) norm(u_0)^2 $

(d) 取 $V = U$，那么

$ integral_(I_n) (dot(U), U) + a(U, U) dif t &= -(U_+^(n-1) - U_-^(n-1), U_+^(n-1))\
=> integral_(I_n) 1/2 dif/(dif t) norm(U)^2 dif t + norm(U_+^(n-1))^2 &<= (U_-^(n-1), U_+^(n-1)) <= 1/2 norm(U_-^(n-1))^2 + 1/2 norm(U_+^(n-1))^2\
=> 1/2 norm(U_-^(n))^2 - 1/2 norm(U_+^(n-1))^2 + norm(U_+^(n-1))^2 &<= 1/2 norm(U_-^(n-1))^2 + 1/2 norm(U_+^(n-1))^2\
=> norm(U_-^n)^2 <= norm(U^(n-1)_-)^2 &<= ... <=  norm(u^0)^2  $
