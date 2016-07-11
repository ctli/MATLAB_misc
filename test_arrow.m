clear all;
close all;
clc;

figure(1); clf;
plot(rand(1,100));

axx = [30 70];
axy = [1 1]*0.65;
[arrowx,arrowy] = dsxy2figxy(gca, axx, axy);
annotation('doublearrow',arrowx,arrowy,'headwidth',6,'headlength',6, 'color', 'g');

text(mean(axx), 0.685, ...
    'TEXT', ...
    'horizontalalignment', 'center', ...
    'fontweight', 'bold', ...
    'fontangle', 'italic', ...
    'fontsize', 14);

