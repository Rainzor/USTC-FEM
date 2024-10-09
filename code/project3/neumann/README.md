# README

> 王润泽 SA24229016
>
> 有限元方法程序作业3

## 代码说明

`main.m` ：程序的入口，主要调用有限元方法求解方程的解，代码最后会输出一系列误差收敛结果。

`fem_solver_neumann.m` ：有限元方法求解两点边值问题的主要程序，包含Neumann边界条件下矩阵构造和求解过程。

## 代码输出

```sh
L2 norm error with N=10: 3.404264e-03
LH1 norm error with N=10: 1.027673e-01
L2 norm error with N=20: 8.561832e-04
LH1 norm error with N=20: 5.148407e-02
L2 norm error with N=40: 2.143658e-04
LH1 norm error with N=40: 2.571213e-02
L2 norm error with N=80: 5.361168e-05
LH1 norm error with N=80: 1.280998e-02
N:10, L2 order:0.000000e+00, LH1 order:0.000000e+00
N:20, L2 order:1.991352e+00, LH1 order:9.971825e-01
N:40, L2 order:1.997845e+00, LH1 order:1.001677e+00
N:80, L2 order:1.999456e+00, LH1 order:1.005181e+00
```

