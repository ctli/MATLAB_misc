% inputs:
%   my_gridline; %no inputs
%   my_gridline('x'); % plot only x gridline
%   my_gridline('y'); % plot only y gridline
%   my_gridline('xy'); % plot both x & y gridlines
%   my_gridline('c'); % specify line color
%   my_gridline([1 0 0]); % specify line color by [R G B] pair
%   my_gridline('front'); % keep gridline at front
%   my_gridline('x','c','font'); % specify multiple inputs

function [] = my_gridline(varargin)

% preserve the range of axes
x_lim = get(gca, 'xlim');
y_lim = get(gca, 'ylim');

% default setting
x_color = [0.9 0.9 0.9];
y_color = [0.9 0.9 0.9];
gline_style = '-';
x_flag = 1; % plot x gridline
y_flag = 1; % plot x gridline
bring_line_to_back = 1; % send the grid lines to the back

if nargin > 0 % if there are inputs
    for a = 1:nargin
        if isnumeric(varargin{a})
            x_color = varargin{a}; y_color = varargin{a};
        else %if ischar(varargin{a})
            switch lower(varargin{a})
                case '--'
                    gline_style = '--';
                case ':'
                    gline_style = ':';
                case 'k'
                    x_color = 'k'; y_color = 'k';
                case 'b'
                    x_color = 'b'; y_color = 'b';
                 case 'r'
                    x_color = 'r'; y_color = 'r';
                case 'g'
                    x_color = 'g'; y_color = 'g';
                case 'm'
                    x_color = 'm'; y_color = 'm';
                case 'c'
                    x_color = 'c'; y_color = 'c';
                case 'x' % plot xgrid
                    x_flag = 1; y_flag = 0;
                case 'y' % plot ygrid
                    x_flag = 0; y_flag = 1;
                case 'xy' % plot both xgrid & ygrid
                    x_flag = 1; y_flag = 1;
                case 'front' % keep gridline at front
                    bring_line_to_back = 0;
            end
        end
    end
end

old_order = get(gca,'children'); % keep the order of existing things in the figure
hold on;

if x_flag==1
    ix = get(gca, 'xtick');
    for ii = 1:length(ix), plot([1 1]*ix(ii), get(gca, 'ylim'), 'color', x_color, 'linestyle', gline_style, 'linewidth', 0.2); end
end

if y_flag==1
    iy = get(gca, 'ytick');
    for ii = 1:length(iy), plot(get(gca, 'xlim'), [1 1]*iy(ii), 'color', y_color, 'linestyle', gline_style, 'linewidth', 0.2); end
end

if bring_line_to_back==1 % re-order plotted lines (send the grid lines to the back)
    new_order = get(gca,'children');
    z = ismember(new_order,old_order);
    manipulate_order = [new_order(z);new_order(~z)];
    set(gca,'children',manipulate_order);
end

set(gca, 'xlim', x_lim);
set(gca, 'ylim', y_lim);
set(gca, 'layer', 'top');

end


% % default setting
% x_color = [0.9 0.9 0.9];
% y_color = [0.9 0.9 0.9];
% xgrid_switch = 'on';
% ygrid_switch = 'on';
% gline_style = '-';
% 
% if nargin > 0 % if there are inputs
%     for a = 1:nargin
%         if ischar(varargin{a})
%             switch lower(varargin{a})
%                 case 'x' % only switch on xgrid
%                     xgrid_switch = 'on';
%                     ygrid_switch = 'off';
%                 case 'y' % only switch on ygrid
%                     xgrid_switch = 'off';
%                     ygrid_switch = 'on';
%                 case 'xy' % switch on both xgrid & ygrid
%                     xgrid_switch = 'on';
%                     ygrid_switch = 'on';
%                 case '--'
%                     gline_style = '--';
%                 case ':'
%                     gline_style = ':';
%             end
%         else % gridline color
%             x_color = varargin{a};
%             y_color = varargin{a};
%         end
%     end
% end
% 
% ax1 = gca;
% 
% % copy the original figure & axis
% Caxes = copyobj(gca,gcf);
% set(Caxes, 'color', 'none');
% 
% % copy the first axis (which will be on the bottom layer) to be grey
% set(ax1, 'xcolor', x_color, 'ycolor', y_color, 'xgrid', xgrid_switch, 'ygrid', ygrid_switch, 'gridlinestyle', gline_style);
% 
% linkaxes([ax1, Caxes], 'xy');

