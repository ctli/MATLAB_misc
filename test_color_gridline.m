% Minor grid with solid lines & grey-color

clear all
close all
clc


%% ================================================================== %%
figure(1); clf;
plot(rand(1,100));

box off;
set(gca, 'yminortick', 'on');
set(gca, 'tickdir', 'out');
% defaultratio;

%% light gray grid lines
y_tick = get(gca, 'ytick');
x_lim = get(gca, 'xlim');
set(gca, 'Color','none');

ax1 = gca;
ax2 = axes('Position',get(ax1,'Position'),...
           'xlim', get(ax1,'xlim'), 'ylim', get(ax1,'ylim'), ...
           'layer', 'bottom', 'Color','w');

for i = 1:length(y_tick)
    plot(ax2, x_lim, [1 1]*y_tick(i), 'color', [0.85 0.85 0.85]); hold on;
end
set(ax2, ...
    'xtick', [], 'xticklabel', [], 'ytick', [], 'yticklabel', [], ...
    'xlim', get(ax1,'xlim'), 'ylim', get(ax1,'ylim'), ...
    'box', 'off');

uistack(ax1, 'top'); % bring ax1 to the front
linkaxes([ax1, ax2], 'xy');


%% ================================================================== %%
% http://www.mathworks.com/support/solutions/en/data/1-1PAYMC/?solution=1-1PAYMC
figure(2); clf;
plot(rand(1, 100));

a = gca;

% Query properties
xtick = get(a,'XTick');
ytick = get(a,'YTick');
xlim = get(a,'XLim');
ylim = get(a,'YLim');

% Copy the existing axis along with children
set(gca,'TickLength',[1e-100 1])
c_axes = copyobj(a,gcf);

% Remove copy of objects
delete(get(c_axes,'Children'))

% Set color XColor to red and only show the grid
set(c_axes, 'Color', 'none', 'XColor', 'r', 'XGrid', 'on', 'YColor','r', 'YGrid','on','XTickLabel',[],'YTickLabel',[],'XTick',xtick,'YTick',ytick,'XLim',xlim,'YLim',ylim);


%% ================================================================== %%
% EDIT3 in below is a better version
% http://stackoverflow.com/questions/6580274/matlab-minor-grid-with-solid-lines-grey-color

hFig = figure(3);
semilogx(logspace(0,5,100), rand(100,1)*5)
hAx1 = gca;   % get a handle to first axis

% create a second transparent axis, as a copy of the first
hAx2 = copyobj(hAx1,hFig);
delete(get(hAx2,'Children'));
set(hAx2, 'Color','none', 'Box','on');

% show grid-lines of first axis, give them desired color, but hide text labels
set(hAx1, 'XColor','g', 'YColor', [0.8 0.8 0.8], ...
    'XMinorGrid','on', 'YMinorGrid','on', ...
    'MinorGridLineStyle', '-', ...
    'XTickLabel',[], 'YTickLabel',[]);

% link the two axes to share the same limits on pan/zoom
linkaxes([hAx1 hAx2],'xy');

% lets create a legend, and some titles
legend(hAx1, 'text');
title(hAx2, 'title');
xlabel(hAx2, 'x');
ylabel(hAx2, 'y');

