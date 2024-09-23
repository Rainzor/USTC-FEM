# README

> 王润泽 SA24229016
>
> 有限元方法程序作业2

## 代码说明

`main.m` 代码是程序的入口，主要调用有限元方法求解方程的解，代码最后会输出一系列误差收敛结果。

`fem_solver2.m` 代码是有限元方法求解两点边值问题的主要程序，包含对应矩阵构造和求解过程。

## 代码输出

```sh
L2 norm error with N=10: 1.704278e-03
LH1 norm error with N=10: 5.387078e-02
L2 norm error with N=20: 4.260306e-04
LH1 norm error with N=20: 2.689400e-02
L2 norm error with N=40: 1.065052e-04
LH1 norm error with N=40: 1.341694e-02
L2 norm error with N=80: 2.662616e-05
LH1 norm error with N=80: 6.679842e-03
N:20, L2 order:2.000132e+00, LH1 order:1.002218e+00
N:40, L2 order:2.000033e+00, LH1 order:1.003229e+00
N:80, L2 order:2.000008e+00, LH1 order:1.006170e+00
```

