% transparent histogram
% http://desk.stinkpot.org:8080/tricks/index.php/2006/07/how-to-make-a-transparent-histogram-in-matlab/

clear all
close all
clc

data1 = randn(1,1000);
data2 = 3 + 2.*randn(1,1000);


figure(1); clf; hold on; box on;

n1 = hist(data1, -10:1:10);
bar(-10:1:10, n1, 0.9, 'FaceColor', 'r', 'edge', 'none'); hold on;

n2 = hist(data2, -10:1:10);
bar(-10:1:10, n2, 0.9, 'FaceColor', [0 0.5 0], 'edge', 'none');

% h = findobj(gca,'Type','patch');
% set(h, 'facealpha',0.75);
alpha(0.75);
xlim([-10 10]);
ylim([0 500]);
set(gca, 'layer', 'top');

% export_fig transparent_test
