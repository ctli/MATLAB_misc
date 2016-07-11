clear all
close all
clc

x = [1 2 3];
y_low = [2 3 4];
y_mid = [5 6 7];
y_hi = [8 9 10];

figure(1); clf;
area(x, y_hi, 'FaceColor', 'y', 'edgecolor', 'none'); hold on;
area(x, y_low, 'FaceColor', 'w', 'edgecolor', 'none');
plot(x, y_mid);
set(gca, 'layer', 'top');
