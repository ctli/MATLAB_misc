% test mexfunction

clear all
clc

%mex my_cfunction.c %no need of this in 2007a

x = 1;
y = [2 3 4 5];
z = [10 20 30 40; 50 60 70 80];

[a b] = my_cfunction(x, z, y);
