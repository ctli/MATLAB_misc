clear all
close all
clc

x = [1 1 1 1 1];
y = [1 2 3 4 5];

cum_x = cumsum(x);

figure(1); clf; hold on; box on;
stairs([0 cum_x], [y y(end)], 'k');
plot(cum_x, y, 'mx', 'markersize', 8);
axis([-0.5 5.5 -0.5 5.5]);
