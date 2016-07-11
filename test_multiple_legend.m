%% http://www.mathworks.com/matlabcentral/newsreader/view_thread/157048

clear
close
clc

x = 1:10;
y1 = x;
y2 = 2*x;
y3 = x+4;
y4 = 0.5*x-2;
y5 = x-4;
y6 = x/3;

% graphics
figure(3); clf;
h = plot(x ,[y1;y2;y3;y4;y5;y6]);
set(h(1), 'color', 'b');
set(h(2), 'color', 'r');
set(h(3), 'color', 'k');
set(h(4), 'color', 'g');
set(h(5), 'color', 'm');
set(h(6), 'color', 'y');

% Plotting 3 legend blocks:

% Block 1
% Axes handle 1 (this is the visible axes)
ah1 = gca;
% Legend at axes 1
legend(ah1,h(1:2),'y1','y2',1)

% Block 2
% Axes handle 2 (unvisible, only for place the second legend)
ah2=axes('position',get(gca,'position'), 'visible','off');
% Legend at axes 2
legend(ah2,h(3:4),'y3','y4',2)

% Block 3
% Axes handle 3 (unvisible, only for place the third legend)
ah3=axes('position',get(gca,'position'), 'visible','off');
% Legend at axes 3
legend(ah3,h(5:6),'y5','y6',3)

