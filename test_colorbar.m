% example: http://figuredesign.blogspot.com/search?q=colorbar

clear all;
close all;
clc;
format compact;

cvec = -0.1:0.1:2.1;
color_level = cbrewer('div', 'RdYlGn', length(cvec), 'linear');

x_data = linspace(0,1,10);
y_data = linspace(0,1,11);
[X,Y] = meshgrid(x_data, y_data);
z_data = X.^2 + Y.^2;
figure(1); clf;
[~, conhand] = contourf(x_data, y_data, z_data, cvec, 'linecolor', 'none');

%get the patch object handles:
p = get(conhand,'children');
thechild = get(p,'CData');   
cdat = cell2mat(thechild);
%loop through and manually set facecolor of each patch to the colormap you  made:
for i=1:length(cvec), set(p(cdat==cvec(i)),'Facecolor',color_level(i,:)); end

%reduce the height to make room for the color bar
lbwh1 = get(gca,'Position'); 
set(gca, 'pos', [lbwh1(1) lbwh1(2) lbwh1(3) 0.78]);

%home-made colorbar (horizontal):
lbwh2 = get(gca,'Position'); 
ax2 = axes('Position',[lbwh2(1) (lbwh2(2)+lbwh2(4)+.03) lbwh2(3) .04]);
[~, conhand] = contourf(ax2, cvec',[0 1],[cvec; cvec],cvec,'linecolor','none');
p = get(conhand,'children');
thechild = get(p,'CData');   
cdat = cell2mat(thechild);
for i=1:length(cvec), set(p(cdat==cvec(i)),'Facecolor',color_level(i,:)); end
set(ax2,'ytick',[],'xaxislocation','top','xtick',0:0.2:2,'fontsize', 8);
annotation('textbox',[lbwh1(1)-0.1 (lbwh2(2)+lbwh2(4)+0.015) 0.1 0.06], ...
           'string', 'CO2', ...
           'fontsize', 8, 'horizontalalignment', 'right', 'linestyle', 'none');


%% ================================================================== %%
color_level = cbrewer('seq', 'Blues', length(cvec), 'linear');

figure(2); clf;
[con, conhand] = contourf(x_data, y_data, z_data, cvec, 'linecolor', 'none');
set(gcf, 'units', 'inch', 'pos', [7.0729    0.5104    5.8333    4.3750]);

%get the patch object handles:
p = get(conhand,'children');
thechild = get(p,'CData');   
cdat = cell2mat(thechild);
%loop through and manually set facecolor of each patch to the colormap you  made:
for i=1:length(cvec), set(p(cdat==cvec(i)),'Facecolor',color_level(i,:)); end

%reduce the width to make room for the color bar
lbwh1 = get(gca,'Position'); 
set(gca, 'pos', [lbwh1(1) lbwh1(2) 0.72 lbwh1(4)]);

lbwh2 = get(gca,'Position'); 
ax2 = axes('Position',[lbwh2(1)+lbwh2(3)+0.03 lbwh2(2) 0.04 lbwh2(4)]);
[~, conhand] = contourf(ax2, [0 1]', cvec ,[cvec; cvec]',cvec,'linecolor','none');
p = get(conhand,'children');
thechild = get(p,'CData');   
cdat = cell2mat(thechild);
for i=1:length(cvec), set(p(cdat==cvec(i)),'Facecolor',color_level(i,:)); end
set(ax2,'xtick',[],'yaxislocation','right','ytick',0:0.2:2,'fontsize',7);
set(ax2,'xaxislocation','top');
xlabel(ax2, 'CO2');


