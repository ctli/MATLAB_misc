%% Test extraploation

clear all;
clc;

X = 8.5:1:19.5;
Y = [100 150 200 200 250 200 200 150 100  75  75  75];

xi = 20;
yi = interp1(X,Y,xi,'linear','extrap');