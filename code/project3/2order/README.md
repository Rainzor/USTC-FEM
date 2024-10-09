# README

> 王润泽 SA24229016
>
> 有限元方法程序作业3

## 代码说明

`main.m` ：程序的入口，主要调用有限元方法求解方程的解，代码最后会输出一系列误差收敛结果。

`fem_solver_2ord.m` ：有限元方法求解两点边值问题的主要程序，包含对应二次基函数系下矩阵构造和求解过程。

## 代码输出

```sh
L2 norm error with N=10: 8.026217e-06
LH1 norm error with N=10: 1.628262e-03
L2 norm error with N=20: 1.001536e-06
LH1 norm error with N=20: 4.120780e-04
L2 norm error with N=40: 1.251375e-07
LH1 norm error with N=40: 1.032172e-04
L2 norm error with N=80: 1.564049e-08
LH1 norm error with N=80: 2.561698e-05
N:20, L2 order:3.002506e+00, LH1 order:1.982344e+00
N:40, L2 order:3.000627e+00, LH1 order:1.997234e+00
N:80, L2 order:3.000157e+00, LH1 order:2.010511e+00
```

