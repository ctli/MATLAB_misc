% Jet colormap code
% two pieces of testing code on the bottom

% [0 0.4 1] % less blue
% [1 0.2 0.2] % less red
% [0 0.675 0] % less green

% [0.3 0.75 1] % light blue
% [1 0.4 0.4] % light red
% [0.4 1 0.4] % light green

% [0.65 0.9 1] % very light blue
% [1 0.7 0.85] % very light red
% [0.675 1 0.675] % very light green

% [0 .5  0] % green (not in the rainbow spectrum)
% [1  0  1] % magenta (not in the rainbow spectrum)

% [0  0  1] % blue
% [1  0  0] % red
% [0  1  0] % light green
% [1  1  0] % yellow

function color_code = rainbow_color(downsample)

color_code_all = [
  0   0 143
  0   0 159
  0   0 175
  0   0 191
  0   0 207
  0   0 223
  0   0 239
  0   0 255 % blue
  0  16 255
  0  32 255
  0  48 255
  0  64 255
  0  80 255
  0  96 255
  0 111 255
  0 128 255
  0 143 255
  0 159 255
  0 175 255
  0 191 255
  0 207 255
  0 223 255
  0 239 255
  0 255 255 % cyan
 16 255 239
 32 255 223
 48 255 207
 64 255 191
 80 255 175
 96 255 159
111 255 143
128 255 128
143 255 111
159 255  96
175 255  80
191 255  64
207 255  48
223 255  32
239 255  16
255 255   0 % yellow
255 239   0
255 223   0
255 207   0
255 191   0
255 175   0
255 159   0
255 143   0
255 128   0
255 111   0
255  96   0
255  80   0
255  64   0
255  48   0
255  32   0
255  16   0
255   0   0 % red
239   0   0
223   0   0
207   0   0
191   0   0
175   0   0
159   0   0
143   0   0
128   0   0]/255;


if downsample > 49
    scale = ((1:downsample)-downsample)*(1-64)/(1-downsample)+64;
    scale = round(scale);
elseif downsample == 1
    color_code_all = [0 0 1]; % blue
    scale = 1;
else % downsample = 2~48
    color_code_all = color_code_all(8:56,:,:);
    scale = ((1:downsample)-downsample)*(1-49)/(1-downsample)+49;
    scale = round(scale);
end
 
color_code = color_code_all(scale, :);


% % ===================================================================== %%
% % for data length longer than 48, color: from dark red to dard
% figure(1);
% x = [0 1];
% y = repmat(ones(1,64),2, 1);
% 
% color_code = rainbow_color(64);
% h = area(x,y);
% axis([0 1 0 64]);
% set(h, 'edge', [0.4 0.4 0.4]);
% set(gca, 'ytick', 0:8:64, 'xtick', 0:1);
% set(gca,'Layer','top');
% 
% for i = 1:length(y)
%     set(h(i),'FaceColor',color_code(i,:,:));
% end
% text(0.5, 56, 'pure red @ 56th position', 'horizontalAlignment', 'center', 'color', 'w');
% text(0.5, 40, 'yellow @ 40th position', 'horizontalAlignment', 'center');
% text(0.5, 24, 'cyan @ 24th position', 'horizontalAlignment', 'center');
% text(0.5, 8, 'pure blue @ 8th position', 'horizontalAlignment', 'center', 'color', 'w');
% 
% % for data length shorter than 48, color: from pure red to pure blue
% figure(2); clf;
% x = [0 1];
% y = repmat(ones(1,28),2, 1);
% 
% color_code = rainbow_color(length(y));
% h = area(x,y);
% axis([0 1 0 64]);
% set(h, 'edge', [0.4 0.4 0.4]);
% set(gca, 'ytick', 0:8:64, 'xtick', 0:1);
% 
% for i = 1:length(y)
% set(h(i),'FaceColor',color_code(i,:,:));
% end

