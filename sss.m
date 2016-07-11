function out = sss(varargin)
%     if isnumeric(varargin{:})
%         disp('numeric');
%     elseif ischar(varargin{:})
%         disp('char');
%     end
    out = size(varargin{:});
end