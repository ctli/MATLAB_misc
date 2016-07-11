clear all
close all
clc

load coast; % world costal lines

figure(1); clf;
ax = worldmap('world');
setm(ax, 'MapProjection', 'miller');
setm(ax, 'MLabelLocation', 45, 'PLabelLocation', 30, 'fontsize', 8); 
setm(ax, 'MlineLocation', 22.5, 'PLineLocation', 15);
setm(ax, 'GLineWidth', 0.5, 'GLinestyle', '-', 'Gcolor', [0.9 0.9 0.9]);
setm(ax, 'FFaceColor', 'w');
geoshow(lat,long,'color','k','linewidth', 1); % show world costal line
axis tight;

set(gcf, 'units', 'inch', 'position', [1.1563    0.8125    9.0000    6.3021]);

scaleruler('units', 'mi', 'MajorTick', 0:1000:2000, 'minortick',0:0.1:0.1, 'minorticklabel', '0', 'RulerStyle', 'patches', 'fontsize', 8);

% USA
setm(handlem('scaleruler1'), 'XLoc', -11e6);
setm(handlem('scaleruler1'), 'YLoc', 2.75e6);

% China
setm(handlem('scaleruler1'), 'XLoc', 10e6);
setm(handlem('scaleruler1'), 'YLoc', 2.75e6);
