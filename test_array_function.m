clear all;
close all;
clc;

data1 = 100:105;
data2 = 20:25;

% Create anonymous function: 
my_sum_function = @(x,y) x+y;
my_sub_function = @(x,y) x-y;
z1 = my_sum_function(data1, data2);
z2 = my_sub_function(data1, data2);

% Create anonymous function with multiple outputs: 
my_function = {@(x,y) x+y;
               @(x,y) x-y};
z3 = my_function{1}(data1, data2);
z4 = my_function{2}(data1, data2);

% Call the analymous fucntion multiple times: 
[D1,D2] = meshgrid(data1, data2);
z5 = my_function{1}(D1, D2);
z6 = my_function{2}(D1, D2);

figure(1); clf;
plot3(data1, data2, z1, 'ko-', 'linewidth', 2); hold on;
plot3(data1, data2, z2, 'ro-', 'linewidth', 2); hold on;

plot3(data1, data2, z3, 'kx-', 'linewidth', 2); hold on;
plot3(data1, data2, z4, 'rx-', 'linewidth', 2); hold on;

mesh(data1, data2, z5, 'facecolor', 'none');
mesh(data1, data2, z6, 'facecolor', 'none');

xlabel('x');
ylabel('y');


