= 10.x.5

Proof: $forall v in VV_h$, $a(u - v, v_h) = 0 quad forall v_h in VV_h$

根据有限元解的性质：
$ a(u_h, v) = F(v) quad forall v in VV_h $

$ a(u, v) = F(v) quad forall v in VV $

那么：
$ norm(u - u_h)_a &<= norm(u - v)_a + norm(v - u_h)_a\
    &<= norm(u - v)_a + sup_(w in VV_h) (a(u_h - v, w))/(norm(w)_a)\
    &<= norm(u - v)_a + sup_(w in VV_h) (a(u - u_h, w) + a(v - u, w))/norm(w)_a\
    &<= norm(u - v)_a + sup_(w in VV_h) (a(u - u_h, w))/norm(w)_a $

$ forall v' in VV_h, norm(u - v)_a^2 = a(u - v, u - v + v - v') = a(u - v, u - v') <= norm(u - v) norm(u - v') $

因此，$norm(u - v)_a <= norm(u - w)_a quad forall w in VV_h$

对不等式同时取下确界，并代入：

$ norm(u - u_h)_a <= inf_(v in VV_h) norm(u-v)_a + sup_(w in VV_h) (a(u - u_h, w))/norm(w)_a $

= 10.x.8

$ abs(e) norm([[w]])_(L^2(e))^2 <= C sum_(T in cal(T)_e) h_T^2 abs(w)_(H^1)^2 $

考虑每一条边上的$[[w]]$，有：$[[w]] = w_1 n_1 + w_2 n_2$，并考虑到$hat([[w]])(1/2) = 0$，其中 $hat([[w]])$ 表示将 $[[w]]$ 转换到$[0,1]$区间上，$hat([[w]])$是线性函数，那么：

$ norm([[w]])_2^2 = integral_e abs([[w]])^2 dif x &= integral_e (w_1 n_1 + w_2 n_2)^2 dif x = integral_([0, 1]) abs(e) hat([[w]]) dif x\
  &<= 1/4 abs(e) (max abs(w_1 - w_2))^2\
  &<= integral_(e) w_1^2 + w_2^2 dif x $

对 $T in cal(T)_e$ 求和：

$ 3 |e| norm([[w]])_2^2 &<= |e| sum_(T in cal(T)_e) integral_e w_(1T)^2 + w_(2T)^2 dif x\
   &<= |e| sum_(T in cal(T)_e) norm(w)_(L^2(e))^2 \
   &<= C|e|^2 sum_(T in cal(T)_e) abs(w)_(H^1(T))^2  quad"(Trace Theorem) " $

然而，$h_T$ 是三角形的直径，$e$是某个三角形的边长，显然$h_T > e$，那么 
$ |e| norm([[w]])_2^2 <= C sum_(T in cal(T)_e) abs(w)_(H^1(T))^2 $


