clear all;
close all;
clc;
format compact;


%% ================================================================== %%
%% unit conversion:
rpm2rads = pi/30;
rads2rpm = 1/rpm2rads;
mph2mps = 1609/3600;
mps2mph = 1/mph2mps;
g2gallon=1/841.4/3.785;


%% ================================================================== %%
cd CYC;

load nedc.mat;
cyc_name = 'NEDC Driving Cycle';
cyc_time = 1:length(sch_cycle);
cyc_mps = sch_cycle(cyc_time,2); % [m/s]
cyc_mph = cyc_mps*mps2mph;
cyc_mps(cyc_mps<0) = 0;
x_lim = [-10 1210];

% load CYC_FUDS.mat
% cyc_name = 'FUDS Driving Cycle';
% cyc_time = 1:length(cyc_mph);
% cyc_mps = cyc_mph(:,2)*mph2mps;
% cyc_mph = cyc_mph(:,2);
% cyc_mps(cyc_mps<0) = 0;
% x_lim = [-10 1410];

% load CYC_US06.mat
% cyc_name = 'US06 Driving Cycle';
% cyc_time = 1:length(cyc_mph);
% cyc_mps = cyc_mph(:,2)*mph2mps;
% cyc_mph = cyc_mph(:,2);
% cyc_mps(cyc_mps<0) = 0;
% x_lim = [-10 610];

cd ..

%% ==============================
figure(1); clf;
[AX,H1,H2] = plotyy(cyc_time, cyc_mps*3.6, 0,0);

xlim(x_lim);
ylim([-0.5 150]);
set(gca, 'box', 'off');
set(legend, 'fontsize', 10);
set(legend, 'FontName', 'Segoe UI Symbol');

set(gca, ...
  'TickDir'     , 'out'     , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.2 .2 .2], ...
  'YColor'      , [.2 .2 .2]);
xlabel('Time (sec)', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
ylabel('Speed (km/h)', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
title(cyc_name, 'FontName', 'Segoe UI Symbol', 'fontsize', 14, 'color', 'k');
set(gca, 'fontsize', 8);
set(gca, 'ytick', 0:25:150);

set(AX(2), ...
    'xlim', x_lim, ...
    'xtick', [], ...
    'xcolor', [.2 .2 .2], 'ycolor', [.2 .2 .2], ...
    'ylim', [-0.5 150], ...
    'ytick', (0:24:150), ...
    'yticklabel', (0:24:150)/1.6, ...
    'fontsize', 8, ...
    'yminortick', 'on', ...
    'TickDir', 'out');
set(get(AX(2),'Ylabel'),'String','Speed (mph)', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);

