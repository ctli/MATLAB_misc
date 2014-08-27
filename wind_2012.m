clear all
close all
clc

r = {'BJ','TJ','HE','SX','NM','LN','JL','HL','SH','JS','ZJ','AH','FJ','JX','SD','HA','HB','HN','GD','GX','HI','CQ','SC','GZ','YN','SN','GS','QH','NX','XJ'};

% [GW]
capacity_2012 = [0.155	0.278	7.9788	2.9071	18.6238	6.1183	3.9974	4.2644	0.352	2.3721	0.4817	0.494	1.2907	0.2875	5.691	0.4926	0.1939	0.2493	1.6913	0.2035	0.3047	0.1044	0.0795	0.5071	1.964	0.7095	6.479	0.1815	3.5657	3.3061];
capacity_2020 = [0.155	0.278	15	7.25	50	7	21.2	7	0.352	10	0.4817	0.494	6	1.7	15	0.4926	0.1939	1.2	1.6913	1.5	1.256	0.1044	0.0795	1	3.8	0.7095	30	6	5	25];

% [TWh]
generation_2012 = [0.31	0.47	12.6	3.6	28.4	7.9	4.4	5.1	0.63	3.7	0.78	0.46	2.8	0.32	6.3	0.33	0.2	0.27	2.4	0.08	0.47	0.08	0.04	0.49	2.8	0.26	9.4	0.02	3.3	4.9];

capacity_factor = generation_2012./(capacity_2012*8760/1e3);
seven_bases = {'GS', 'XJ', 'HE', 'JL', 'NM', 'JS'};
[v, ia, ib] = setxor(r, seven_bases);

%% ==============================
figure(1); clf; hold on;
hb = bar(1:30, [capacity_2012;capacity_2020]', 'hist');
set(hb, 'edgecolor', 'none');
set(gca, 'xtick', 1:30, 'xticklabel', r);
xlim([0 31]);
set(gca, 'fontsize', 8);
set(gca, 'ticklength', [0.003 0.003]);
ylabel('Wind Capacity (GW)');
title('Installed Wind Capacity in 2012', 'fontsize', 10, 'fontweight', 'bold');
set(gcf, 'units', 'inch', 'pos', [0.7292    6.7292    9.35    2]);
set(gca, 'pos', [0.0569    0.1023    0.9263    0.7883]);
my_gridline('y');

% ==========
figure(2); clf; hold on;
bar(generation_2012);
set(gca, 'xtick', 1:30, 'xticklabel', r);
xlim([0 31]);
set(gca, 'fontsize', 8);
set(gca, 'ticklength', [0.003 0.003]);
ylabel('Wind Capacity (TWh)');
title('Wind Generation in 2012', 'fontsize', 10, 'fontweight', 'bold');
set(gcf, 'units', 'inch', 'pos', [0.7292    3.7708    9.35    2]);
set(gca, 'pos', [0.0569    0.1023    0.9263    0.7883]);

tmp = generation_2012;
tmp(ia) = 0;
hb = bar(tmp, 'facec', [0.5 0 0], 'edge', 'none');
legend(hb, 'The 7 Big Wind Bases in 2020');
my_gridline('y');

% ==========
figure(3); clf; hold on;
bar(capacity_factor);
set(gca, 'xtick', 1:30, 'xticklabel', r);
xlim([0 31]);
ylim([0 0.25]);
set(gca, 'fontsize', 8);
set(gca, 'ticklength', [0.003 0.003]);
ylabel('Capacity Factor (-)');
title('Wind Capacity Factor in 2012', 'fontsize', 10, 'fontweight', 'bold');
set(gcf, 'units', 'inch', 'pos', [0.7292    0.7917    9.35    2]);
set(gca, 'pos', [0.0569    0.1023    0.9263    0.7883]);

tmp = capacity_factor;
tmp(ia) = 0;
bar(tmp, 'facec', [0.5 0 0], 'edge', 'none');
my_gridline('y');




