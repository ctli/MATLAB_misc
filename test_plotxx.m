clear all
close all
clc

D = linspace(-100,0,50);
S = linspace(34,32,50);
T = 10*exp(D/40);

figure(1); clf;
plot(T,D, 'b', 'linewidth', 2);
ax1 = gca;
set(ax1, 'box', 'off', 'XColor','b','YColor','k');
xlabel('Temperature (C)');
ylabel('Depth(m)');

% plot the second dataset
ax2 = axes('Position',get(ax1,'Position'));

plot(S,D, 'r', 'linewidth', 2, 'parent', ax2);
set(ax2, 'box', 'off', ...
         'XColor','r','YColor','k', ...
         'XAxisLocation','top','YAxisLocation','right',...
         'Color','none', ...
         'ylim', get(ax1, 'ylim'));
ylabel('Depth(m)');
xlabel('Salinity');

