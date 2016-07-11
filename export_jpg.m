% command lines to export tiff figure

% default filename: "temp_figure"
% default resolution: 200 dpi

% Examples:
% export_tiff;                          % no input argument, use default file name: "temp_figure"
% export_tiff('fig1_1');                % first argument is always the file name
% export_tiff('fig1_1', 'expand');      % expand axis to fill figure
% export_tiff('fig1_1', 300);           % specify resolution (dpi)
% export_tiff('fig1_1', 300, 'expand'); % dpi & axis-format are interchangeable
% export_tiff('fig1_1', 'expand', 300); % dpi & axis-format are interchangeable

function [] = export_jpg(varargin)

if (nargin>0) %number of function arguments
    filename = varargin{1}; % first argument is always the file name
    for k = 2:length(varargin)
        if isnumeric(varargin{k})
            resolution_dpi = ['-r', num2str(varargin{k})];
        else % input is not numeric, so it is char
            param = varargin{k};
            if strcmpi(param, 'expand') % the string comparison is csae-insensitive
                T = get(gca,'tightinset');
                set(gca,'position',[T(1) T(2) 1-T(1)-T(3) 1-T(2)-T(4)]);
            end
        end
    end
else % no input argument, so assign a temperal file name
    filename = 'temp_figure';
end

if ~exist('resolution_dpi', 'var')
    resolution_dpi = '-r200';
end

set(gcf, 'PaperPositionMode', 'auto'); % use screen aspact ratio
print(gcf, resolution_dpi, '-djpeg', filename); % resolution 150 dpi, tiff format

end