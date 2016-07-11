% "imagesc", but not "plot"
% f = getframe(figure(1)); % catch figue with axis
% f = getframe; % catch figure without axis

clc;clear all;close all; format compact;

z=imagesc(randn(50,50));
set(gcf, 'Color' ,'w'); % set background to be white
% f = getframe(figure(1)); % with axis
f = getframe; % without axis
[im,map] = rgb2ind(f.cdata,512,'nodither');

for k = 1:20
    k
    imagesc(k*randn(20,20)),title(['B=' num2str(k)]);
    set(gcf, 'Color' ,'w');
%     f = getframe(figure(1));
    f = getframe; % without axis
    im(:,:,1,k) = rgb2ind(f.cdata,map,'nodither');
%     pause(0.2);
end
imwrite(im,map,'gif_example.gif','DelayTime',0.25)
