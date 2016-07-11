%% Symbolic matrix inverse

clear all;
clc;

syms s K1 M1 B1 M K

A = [s -1 0 0;
     K1/M1 (s+B1/M1) -K1/M1 -B1/M1;
     0 0 s -1;
     -K1/M -B1/M (K1/M+K/M) (s+B1/M)];
Ai = inv(A);

C = [0 0 1 0];
B = [0 0 0 1/M]';

sys = C*Ai*B