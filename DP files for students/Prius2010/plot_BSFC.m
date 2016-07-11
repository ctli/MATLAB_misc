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
Engine_2rz_0410; % with 0 torque input
cd ..

figure(1); clf;
[C,h] = contour(eng_consum_spd*rads2rpm, eng_consum_trq(2:end), eng_consum_fuel(:,2:end)', -0.5:0.5:6);
clabel(C,h);
set(gca, 'ytick', 0:25:150);
xlabel('Speed (rpm)');
ylabel('Torque (Nm)');
title('Fuel Rate (g/s)');


%% ================================================================== %%
%% Generate optimal BSFC line by instantaneous optimization  
power_level = 0:1000:70000;
x_rpm = 100:10:5200;

Pe_optbsfc = power_level;
We_optbsfc = zeros(1, length(power_level));
Te_optbsfc = zeros(1, length(power_level));
fuel_optbsfc = zeros(1, length(power_level));

figure(2); clf; hold on;
for i = 1:length(power_level)
    x_rads = x_rpm*rpm2rads;
    y_trq = power_level(i)./x_rads;
    z_bsfc = interp2(eng_consum_trq, eng_consum_spd, eng_consum_fuel, y_trq, x_rads);
    [value, id] = min(z_bsfc);
    
    We_optbsfc(i) = x_rads(id);
    Te_optbsfc(i) = y_trq(id);
    fuel_optbsfc(i) = value;
    
    if ismember(power_level(i), [2000, 5000, 10000:10000:70000])
        h1 = plot(x_rpm, y_trq, 'color', [0.9 0.9 0.9], 'linewidth', 1);
    end
end
% plot(We_optbsfc, Te_optbsfc, 'ko', 'markersize', 3, 'markerf', 'k');
Pe_optbsfc([1, 3:4, 66:end]) = [];
We_optbsfc([1, 3:4, 66:end]) = [];
Te_optbsfc([1, 3:4, 66:end]) = [];
fuel_optbsfc([1, 3:4, 66:end]) = [];
h2 = plot(We_optbsfc*rads2rpm, Te_optbsfc, 'ro-', 'markersize', 3, 'markerf', 'r');

h3 = plot(eng_map_spd*rads2rpm, eng_max_trq, 'k', 'linewidth', 2);

[C,h] = contour(eng_consum_spd*rads2rpm, eng_consum_trq, eng_bsfc', [216 200:5:250, 275, 300:100:800]);
clabel(C,h, 'fontsize', 8);
axis([0 5500 0 150]);

text(500, 2000/(500*rpm2rads), '2kW', 'color', [0.6 0.6 0.6], 'rotation', -60, 'fontsize', 8, 'fontweight', 'bold');
text(1000, 5000/(1000*rpm2rads), '5kW', 'color', [0.6 0.6 0.6], 'rotation', -45, 'fontsize', 8, 'fontweight', 'bold');
text(1550, 10000/(1550*rpm2rads), '10kW', 'color', [0.6 0.6 0.6], 'rotation', -45, 'fontsize', 8, 'fontweight', 'bold');
text(2400, 20000/(2400*rpm2rads), '20kW', 'color', [0.6 0.6 0.6], 'rotation', -45, 'fontsize', 8, 'fontweight', 'bold');
text(3100, 30000/(3100*rpm2rads), '30kW', 'color', [0.6 0.6 0.6], 'rotation', -45, 'fontsize', 8, 'fontweight', 'bold');
text(3700, 40000/(3700*rpm2rads), '40kW', 'color', [0.6 0.6 0.6], 'rotation', -45, 'fontsize', 8, 'fontweight', 'bold');
text(4150, 50000/(4150*rpm2rads), '50kW', 'color', [0.6 0.6 0.6], 'rotation', -45, 'fontsize', 8, 'fontweight', 'bold');
text(4600, 60000/(4600*rpm2rads), '60kW', 'color', [0.6 0.6 0.6], 'rotation', -40, 'fontsize', 8, 'fontweight', 'bold');

legend([h, h2, h3, h1], 'BSFC Contour', 'Optimal BSFC line', 'Max Torque', 'Constant power lines', 4);
% set(legend, 'units', 'pixels');
% set(legend, 'pos', [58.5954  210.3453  169.0000   54.6667]);
set(legend, 'fontsize', 10);
set(legend, 'FontName', 'Estrangelo Edessa');

set(gca, ...
  'TickDir'     , 'out'     , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.2 .2 .2], ...
  'YColor'      , [.2 .2 .2], ...
  'fontsize', 8);
xlabel('Speed (rpm)', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
ylabel('Torque (Nm)', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
title('Engine BSFC (g/kWh)', 'FontName', 'Segoe UI Symbol', 'fontsize', 14, 'color', 'k');
set(gca, 'fontsize', 8);
set(gca, 'ytick', 0:25:150);
set(gca, 'box', 'off');

% export_fig BSFC -r300 -painters

%% ==============================
%% further process optimal BSFC line (for DP)
We_temp = [0 980*rpm2rads We_optbsfc(7:62)];
Te_temp = [0  0  Te_optbsfc(7:62)];
plot(We_temp*rads2rpm, Te_temp, 'kx-', 'markersize', 8);

[b, m, n] = unique(We_temp);
We_temp_unique = We_temp(m);
Te_temp_unique = Te_temp(m);

We_lookup = (0:50:5200)*rpm2rads;
Te_lookup = interp1(We_temp_unique, Te_temp_unique, We_lookup, 'linear', 'extrap');

Te_bound = interp1(eng_map_spd, eng_max_trq, We_lookup);
Te_lookup(Te_lookup>Te_bound) = Te_bound(Te_lookup>Te_bound);
plot(We_lookup*rads2rpm, Te_lookup, 'g', 'markersize', 8);

