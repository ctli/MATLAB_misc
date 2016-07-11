clear all;
close all;
clc;


fig=figure;
set(fig,'DoubleBuffer','on');
set(gca,'xlim',[-80 80],'ylim',[-80 80],...
        'NextPlot','replace','Visible','off');
mov = avifile('avi_example2.avi');
x = -pi:.1:pi;
radius = 0:length(x);
for k=1:length(x)
    h = patch(sin(x)*radius(k),cos(x)*radius(k),...
                 [abs(cos(x(k))) 0 0]);
    set(h,'EraseMode','xor');
    F = getframe(gca);
    mov = addframe(mov,F);
end
mov = close(mov);
