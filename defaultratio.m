% set the figure width and height for ppt
% width = 4 in, height = 3 in

function [] = defaultratio_ppt(varargin)

xx = get(gca, 'xlim');
xt = get(gca, 'xtick');
yy = get(gca, 'ylim');
yt = get(gca, 'ytick');

        
if (nargin >0)
    if isnumeric(varargin{1})
        ratio = varargin{1};
    end
    
    if strcmp(varargin, 'old axis')
        xx = get(gca, 'xlim');
        xt = get(gca, 'xtick');
        yy = get(gca, 'ylim');
        yt = get(gca, 'ytick');
    end
end

if ~exist('ratio')
    ratio = 1;
end

set(gcf,'Units', 'inches');
figure_position = get(gcf, 'Position'); %[left bottom width height]
set(gcf, 'Position', [figure_position(1:2), 4*ratio, 3*ratio]);

if (nargin >0)
    if strcmp(varargin, 'old axis')
        axis([xx yy]);
        set(gca, 'xtick', xt, 'ytick', yt);
    end
end
