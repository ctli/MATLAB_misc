clear all;
close all;
clc;
format compact;


%% ================================================================== %%
%% unit conversion:
rpm2rads = pi/30;
rads2rpm = 1/rpm2rads;
mph2mps = 1609/3600;
g2gallon=1/841.4/3.785;


%% ================================================================== %%
cd Components;
Motor_int;
cd ..

%% ==============================
figure(1); clf;
[C,h] = contour(m_map_spd*rads2rpm, m_map_trq, m_eff_map', [0.3:0.1:0.9 0.92:0.02:1]);
clabel(C,h, 'fontsize', 7);

set(gca, ...
  'TickDir'     , 'out'     , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.2 .2 .2], ...
  'YColor'      , [.2 .2 .2]);
xlabel('Speed (rpm)', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
ylabel('Torque (Nm)', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
title('Motor Efficiency', 'FontName', 'Segoe UI Symbol', 'fontsize', 14, 'color', 'k');
set(gca, 'fontsize', 8);
set(gca, 'box', 'off');

hold on;
plot(m_max_spd*rads2rpm, m_max_trq, 'k', 'linewidth', 1);
plot(m_max_spd*rads2rpm, -m_max_trq, 'k', 'linewidth', 1);
plot([0 12000], [0 0], '-', 'color', [.2 .2 .2]);

% power_level = [2000, 5000, 10000:10000:50000];
% for i = 1:length(power_level)
%     x_rpm = 100:100:12000;
%     x_rads = x_rpm*rpm2rads;
%     y_trq = power_level(i)./x_rads;
%     plot(x_rpm, y_trq, 'color', [0.9 0.9 0.9], 'linewidth', 1);
% end
% text(500, 2000/(500*rpm2rads), '2kW', 'color', [0.6 0.6 0.6], 'rotation', -50, 'fontsize', 8, 'fontweight', 'bold');
% text(950, 5000/(950*rpm2rads), '5kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');
% text(1450, 10000/(1450*rpm2rads), '10kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');
% text(2150, 20000/(2150*rpm2rads), '20kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');
% text(2750, 30000/(2750*rpm2rads), '30kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');
% text(3200, 40000/(3200*rpm2rads), '40kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');
% text(3600, 50000/(3600*rpm2rads), '50kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');

% export_fig MTR_eff -r300 -painters


%% ==============================
figure(2); clf;
[C,h] = contour(g_map_spd*rads2rpm, g_map_trq, g_eff_map', [0.3:0.1:0.9 0.92:0.02:1]);
clabel(C,h, 'fontsize', 8);
axis([0 12000 -140 140]);
set(gca, 'ytick', -140:35:140);

set(gca, ...
  'TickDir'     , 'out'     , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.2 .2 .2], ...
  'YColor'      , [.2 .2 .2]);
xlabel('Speed (rpm)', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
ylabel('Torque (Nm)', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
title('Generator Efficiency', 'FontName', 'Segoe UI Symbol', 'fontsize', 14, 'color', 'k');
set(gca, 'fontsize', 8);
set(gca, 'box', 'off');

hold on;
plot(g_max_spd*rads2rpm, g_max_trq, 'k', 'linewidth', 1);
plot(g_max_spd*rads2rpm, -g_max_trq, 'k', 'linewidth', 1);
plot([0 12000], [0 0], '-', 'color', [.2 .2 .2]);

% power_level = [2000, 5000, 10000:10000:50000];
% for i = 1:length(power_level)
%     x_rpm = 100:100:12000;
%     x_rads = x_rpm*rpm2rads;
%     y_trq = power_level(i)./x_rads;
%     plot(x_rpm, y_trq, 'color', [0.9 0.9 0.9], 'linewidth', 1);
% end
% text(500, 2000/(500*rpm2rads), '2kW', 'color', [0.6 0.6 0.6], 'rotation', -50, 'fontsize', 8, 'fontweight', 'bold');
% text(950, 5000/(950*rpm2rads), '5kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');
% text(1450, 10000/(1450*rpm2rads), '10kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');
% text(2150, 20000/(2150*rpm2rads), '20kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');
% text(2750, 30000/(2750*rpm2rads), '30kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');
% text(3200, 40000/(3200*rpm2rads), '40kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');
% text(3600, 50000/(3600*rpm2rads), '50kW', 'color', [0.6 0.6 0.6], 'rotation', -35, 'fontsize', 8, 'fontweight', 'bold');

% export_fig GEN_eff -r300 -painters

