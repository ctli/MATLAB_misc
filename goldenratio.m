% set the figure aspect ratio to golden ratio 1.62
% width = 4 in, height = 2.47 in (figure format for powerpoint)

function [] = goldenratio()

set(gcf,'Units', 'inches');
figure_position = get(gcf, 'Position'); %[left bottom width height]
set(gcf, 'Position', [figure_position(1:2), 4, 2.47]);

% T = get(gca,'tightinset');
% set(gca,'position',[T(1) T(2) 1-T(1)-T(3) 1-T(2)-T(4)]);

