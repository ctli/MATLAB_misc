% Using Multiple X- and Y-Axes
%
% cannot use "stairs" command in the second axis

clear all
close all
clc

x1 = 0:.1:40;
y1 = 4.*cos(x1)./(x1+2);
x2 = 1:.2:20;
y2 = x2.^2./x2.^3;

% plot the first dataset
hl1 = line(x1,y1,'Color','r');
ax1 = gca;
set(ax1,'XColor','r','YColor','r');

% adjust limits of the first dataset
xlimits = get(ax1,'XLim');
ylimits = get(ax1,'YLim');
set(ax1,'XTick',xlimits(1):7:xlimits(2), 'YTick',ylimits(1):0.33:ylimits(2));
grid on

% plot the second dataset
ax2 = axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','k','YColor','k');
hl2 = line(x2,y2,'Color','k','Parent',ax2);
% stairs(ax2, x2,y2,'Color','k'); % cannot work

grid on
