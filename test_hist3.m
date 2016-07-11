% 3-D histogram (use "hist3" & "pcolor")

clear all
close all
clc

x = randn(1000,2);

figure(1); clf;
center_x = linspace(-5,5,10);
center_y = linspace(-5,5,15);
center = {center_x, center_y}; % create a cellarray
hist3(x, center);
set(gcf, 'renderer', 'opengl');
set(get(gca,'child'), 'FaceColor', 'interp', 'CDataMode', 'auto');
colormap hot
colormap(flipud(colormap));

hold on;
n = hist3(x, center);
h = pcolor(center_x,center_y,n');
set(h, 'zdata', ones(size(n')) * -max(n(:))); % shift the map to a more negative z-location, so it is not blocked by the histogram
title('Seamount:Data Point Density Histogram and Intensity Map');
grid on
view(3);