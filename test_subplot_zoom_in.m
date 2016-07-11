% Zoomed In/Out Plots within Subplots in Matlab
% http://stackoverflow.com/questions/6645790/zoomed-in-out-plots-within-subplots-in-matlab

clear all
close all
clc


% sample data
x = 1:100;
left = randn(100,1);
right = cumsum(rand(100,1)-0.5);

% build axes positions
hBig = [subplot(121) subplot(122)];         % create subplots
posBig = get(hBig, 'Position');             % record their positions
delete(hBig)                                % delete them
posSmall{1} = [0.275 0.63 0.16 0.24];
posSmall{2} = [0.717 0.63 0.16 0.24];

% create axes (big/small)
hAxB(1) = axes('Position',posBig{1});
hAxB(2) = axes('Position',posBig{2});
hAxS(1) = axes('Position',posSmall{1});
hAxS(2) = axes('Position',posSmall{2});

% plot
plot(hAxB(1), x, left, 'b');
plot(hAxB(2), x, right, 'b');
plot(hAxS(1), x, left, 'r');
plot(hAxS(2), x, right, 'r');

% set axes properties
set(hAxB, 'XLim',[1 100], 'YLim',[-10 10]);
set(hAxS , 'Color','none', 'XAxisLocation','top', 'YAxisLocation','right');

% background color of the smaller axes to be opaque (non-transparent)
set(hAxS , 'Color','w');

