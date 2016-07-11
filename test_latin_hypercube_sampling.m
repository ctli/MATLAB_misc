% test latin hypercube sampling "lhsnorm"

clear all
close all
clc

mu = 10;
sigma = 1;
n = 1000;

% X = lhsnorm(mu,sigma,n);
[X,Z] = lhsnorm(mu,sigma,n);

figure(1); clf;
plot(1:n, X, 1:n, Z, 'x-');
%%
figure(2); clf;
plot(sort(X), 'x-');
hold on;
plot(sort(Z), 'x-r');
