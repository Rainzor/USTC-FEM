= 4.8
Let $VV_h$ be a finite element space on a trianglation $T_h$ of the domain $Omega subset RR^d$ satisfying
$ norm(u - pi_h u)_(L^2 (Omega)) <= C h^(r + 1) abs(u)_(H^(r+1) (Omega)) $
Given $u in L_2(Omega)$, let $u_h in VV_h$ be the $L_2 (Omega)$ projection of $u$ onto $VV_h$ i.e.
$ (u_h, v) = (u, v) forall v in VV_h $
where $(dot, dot)$ is the scalar product in $L_2 (Omega)$. Prove the error estimate:
$ norm(u - u_h)_(L_2 (Omega)) <= inf_(v in VV_h) norm(u - v)_(L_2 (Omega)) <= C h^(r + 1) abs(u)_(H^(r+1) (Omega)) $
and that
$ norm(u_h)_(L_2(Omega)) <= norm(u)_(L_2(Omega)) $

*Proof* :

Let $v in VV_h$ be arbitrary, then

$ (u - u_h, v) = 0 quad forall v in VV_h $

Let $e = u_h - v in VV_h$, then $(e, v) = 0 space forall v in VV_h$

$ norm(u - u_h)^2 &= (u - u_h, u - u_h) = (u - v + e, u - v + e)\
  &= (u - v, u - v) + (e, e) + 2(u - v, e)\
  &= (u - v, u - v) + (e, e)\
  &= norm(u - v)^2 + norm(e)^2 $

Therefore, 
$ norm(u - u_h) <= inf_(v in VV_h) norm(u - v) $

Now, let $v = pi_h u$, then

$ inf_(v in VV_h) norm(u - v) <= norm(u - pi_h u) <= C h^(r + 1) abs(u)_(H^(r+1) (Omega)) $

Therefore,

$ norm(u - u_h) <=  inf_(v in VV_h) norm(u - v) <= C h^(r + 1) abs(u)_(H^(r+1) (Omega)) $

Now, we prove that $norm(u_h)_(L_2(Omega)) <= norm(u)_(L_2(Omega))$.

Because $u_h in VV_h$, $(u - u_h, u) = 0$, then

$ norm(u_h)^2 - norm(u)^2 &= (u_h + u, u_h - u) \
  &= (u - u_h, u_h - u) = - norm(u - u_h)^2 <= 0 $

Therefore, $norm(u_h)_(L_2(Omega)) <= norm(u)_(L_2(Omega))$
