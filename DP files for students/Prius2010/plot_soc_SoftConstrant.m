
soc_range = [
0.02
0.019
0.018
0.017
0.016
0.015
0.014
0.013
0.012
0.011
0.01
0.009
0.008
0.007
0.006
0.005
0.004
0.003
0.002
0.001
0
];

soft_constraint = [
0.001
0.003
0.005
0.0068
0.0122
0.022
0.0338
0.05
0.068
0.1020
0.1650
0.2980
0.4600
0.7000
1.2
2.14
3.38
5.2
7.33
10
10];

figure(1); clf;
plot(soc_range+0.4, soft_constraint);

set(gca, ...
  'TickDir'     , 'out'     , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.2 .2 .2], ...
  'YColor'      , [.2 .2 .2]);
xlabel('SOC (-)', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
ylabel('Penalty', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
title('Soft Constraint for SOC', 'fontname', 'Segoe UI Symbol', 'fontsize', 14, 'color', 'k');
box off;

export_fig soc_SoftContraint -painters

