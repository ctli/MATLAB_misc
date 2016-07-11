% Surface fit, z = f(x,y) (use "lsqcurvefit")
% http://www.mathworks.com/matlabcentral/answers/99275

clear all;
close all
clc;


%% ================================================================== %%
% raw data
xdata = [3.6 7.7 9.3 4.1 8.6 2.8 1.3 7.9 10.0 5.4];
ydata = [16.5 150.6 263.1 24.7 208.5 9.9 2.7 163.9 325.0 54.3];
zdata = [95.09 23.11 60.63 48.59 89.12 76.97 45.68 1.84 82.17 44.47];


%% ================================================================== %%
input(1,:,1) = xdata;
input(1,:,2) = ydata;

% Create Objective Function: 
mysurface = @(a,data) a(1)*data(:,:,2).*data(:,:,1).^2 + a(2)*sin(data(:,:,1)) + a(3)*data(:,:,2).^3;

% Do Regression:
a0 = [10 10 10]; % Starting guess
[a, resnorm] = lsqcurvefit(mysurface, a0, input, zdata);

% Calculate Fitted Surface:
x_grid = linspace(1, 10, 10);
y_grid = linspace(5, 325, 10);
[X,Y] = meshgrid(x_grid, y_grid);
XY(:,:,1) = X;
XY(:,:,2) = Y;
Z = mysurface(a,XY);

figure(1); clf;
plot3(xdata, ydata, zdata, 'ko', 'markersize', 5); % Original Data
hold on;
mesh(X, Y, Z, 'facecolor', 'none', 'linewidth', 2); % Fitted Surface
xlabel('X \rightarrow');
ylabel('\leftarrow Y');
zlabel('Z \rightarrow');
grid on;

