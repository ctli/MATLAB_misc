clear all
close all
clc

region = {'Northeast', 'Inner Mongolia', 'Northwest', 'North', 'East', 'Central', 'South'};

capacity = [
    107 % northeast, [GW]
     56 % inner mongolia
    118 % northwest
    195 % north
    233 % east
    236 % central
    202];%south

peak_demand = [
     42 % [GW]
    nan
     44
    158
    171
    122
    113];

generation_adaquacy = peak_demand./capacity;

% ==============================
figure(1); clf;
bar(generation_adaquacy, 'facec', [0.4 0.4 0.4], 'edge', 'none');
ylim([0 1]);
xlim([0.4 7.6]);
goldenratio;
set(gca, 'fontsize', 8);
ylabel('Generation Adaquacy (-)');
h = my_xticklabels(gca, 1:7, region, 'Rotation',25, 'horizontalalignment', 'right', 'fontsize', 8);
box off;
my_gridline('y');
set(gca, 'layer', 'bottom');
set(gca, 'pos', [0.1300    0.2017    0.8335    0.7401]);
text(2,0.03, 'N/A', 'rotation', 90, 'fontsize', 9, 'fontweight', 'bold');
text(0.65, 0.92, 'Peak/Capacity Ratio')
% export_fig generation_adaquacy -painters;



