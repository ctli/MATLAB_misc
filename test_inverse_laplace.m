%% Inverse Laplace transform

clear all; clc;

syms s % you have to tell MATLAB what is the variable

zs = (50.27*s + 50.27)/(s^4 + 2*s^3 + 633.7*s^2 + 1263*s + 1263);
zt = ilaplace(zs);

f = 1/s^2;
ft = ilaplace(f);

