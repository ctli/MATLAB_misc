% 2D data fitting - Surface (use "lsqcurvefit")
% http://www.mathworks.com/matlabcentral/answers/119001-2d-data-fitting-surface

clear all
close all
clc


%% ================================================================== %%
% raw data
x = [1 2 4 6 8 10 13 17 21 25];
y = [0.2 0.5 1 2 4 7 10 14 18 22];
z = [1 0.6844 0.3048 0.2124 0.1689 0.1432 0.1192 0.1015 0.0908 0.0841;...
1.000 0.7096 0.3595 0.2731 0.2322 0.2081 0.1857 0.1690 0.1590 0.1529;...
1.000 0.7451 0.4362 0.3585 0.3217 0.2999 0.2797 0.2648 0.2561 0.2504;...
1.000 0.7979 0.5519 0.4877 0.4574 0.4394 0.4228 0.4107 0.4037 0.3994;...
1.000 0.8628 0.6945 0.6490 0.6271 0.6145 0.6027 0.5945 0.5896 0.5870;...
1.000 0.9131 0.8057 0.7758 0.7614 0.7531 0.7457 0.7410 0.7383 0.7368;...
1.000 0.9397 0.8647 0.8436 0.8333 0.8278 0.8228 0.8195 0.8181 0.8171;...
1.000 0.9594 0.9087 0.8942 0.8877 0.8839 0.8808 0.8791 0.8783 0.8777;...
1.000 0.9705 0.9342 0.9238 0.9190 0.9165 0.9145 0.9133 0.9131 0.9127;...
1.000 0.9776 0.9502 0.9425 0.9390 0.9372 0.9358 0.9352 0.9349 0.9348];


%% ================================================================== %%
% Do surface fit
[X, Y] = meshgrid(x,y);

% Create input independent variable (10 x 10 x 2):
XY(:,:,1) = X;
XY(:,:,2) = Y;

% Create Objective Function: 
surfit = @(B,XY)  B(1)*exp(B(2).*XY(:,:,1)) + (1 - exp(B(3).*XY(:,:,2))); 

% Do Regression
B = lsqcurvefit(surfit, [0.5 -0.5 -0.5], XY, z, [0  -10  -10],  [1  10  10])

% Calculate Fitted Surface:
Z = surfit(B,XY);

figure(1); clf;
stem3(x, y, z, 'k', 'fill', 'markersize', 5); % Original Data
hold on
mesh(X, Y, Z, 'facecolor', 'none', 'linewidth', 2); % Fitted Surface
hold off
xlabel('X \rightarrow');
ylabel('\leftarrow Y');
zlabel('Z \rightarrow');

