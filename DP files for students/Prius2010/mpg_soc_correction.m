%% soc correction
%% cases:
%%  1.NEDC cycle, alpha = 10
%%  2.NEDC cycle, alpha = 50000
%%  3.UDDS cycle, alpha = 50000
%%  4.US06 cycle, alpha = 50000

clear all
close all
clc
format compact


%% ================================================================== %%
%% full NEDC cycle, alpha = 10 (alpha = 1 ~ 1000 produces the same results)
soc_ini = [0.41     0.45     0.5      0.55     0.6      0.65     0.7];
dsoc  = [  0.0887   0.0764   0.0214  -0.0314  -0.1043  -0.1240  -0.1795];
mpg = [   46.2809  47.4607  50.6539  54.0214  58.9055  61.8066  65.7719];

figure(1); clf; hold on;
h1 = plot(dsoc, mpg, 'o', 'markerf', 'b', 'markersize', 4);
xlim([-0.2 0.2]);
ylim([30 70]);
grid on
set(gca, ...
    'fontsize'   , 8         , ...
    'TickDir'    , 'out'     , ...
    'XColor'     , [.2 .2 .2], ...
    'YColor'     , [.2 .2 .2]);
xlabel('\Delta SOC', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
ylabel('mpg', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);

% linear curve fit
p = polyfit(dsoc,mpg,1);
x_range = -0.2:0.01:0.2;
y_range = x_range*p(1) + p(2);
h2 = plot(x_range, y_range, 'r', 'linewidth', 1);
text(0, 55, ['Eq: y = ', num2str(p(1)), 'x + ' num2str(p(2))], 'FontName', 'Calibri', 'fontsize', 12);

legend([h1 h2], 'Data', 'Linear Fit');
set(legend, 'fontsize', 10);
set(legend, 'FontName', 'Estrangelo Edessa');

title('MPG with SOC Correction; NEDC Cycle; \alpha = 10', 'fontsize', 14, 'color', 'k');


%% ================================================================== %%
%% full NEDC cycle, alpha = 50000
soc_ini = [0.41     0.45     0.5      0.55     0.6      0.65     0.7];
dsoc  = [  0.1364   0.0992   0.0527  -0.0042  -0.0467  -0.1012  -0.1553];
mpg = [   44.1212  46.2525  49.2771  52.4069  55.3685  59.7732  64.2354];

figure(2); clf; hold on;
h1 = plot(dsoc, mpg, 'o', 'markerf', 'b', 'markersize', 4);
xlim([-0.2 0.2]);
ylim([30 70]);
grid on
set(gca, ...
    'fontsize'   , 8         , ...
    'TickDir'    , 'out'     , ...
    'XColor'     , [.2 .2 .2], ...
    'YColor'     , [.2 .2 .2]);
xlabel('\Delta SOC', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
ylabel('mpg', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);

% linear curve fit
p = polyfit(dsoc,mpg,1);
x_range = -0.2:0.01:0.2;
y_range = x_range*p(1) + p(2);
h2 = plot(x_range, y_range, 'r', 'linewidth', 1);
text(0, 55, ['Eq: y = ', num2str(p(1)), 'x + ' num2str(p(2))], 'FontName', 'Calibri', 'fontsize', 12);

legend([h1 h2], 'Data', 'Linear Fit');
set(legend, 'fontsize', 10);
set(legend, 'FontName', 'Estrangelo Edessa');

title('MPG with SOC Correction; NEDC Cycle; \alpha = 50000', 'fontsize', 14, 'color', 'k');

% export_fig NEDC_mpg_a50000 -painters


%% ================================================================== %%
%% UDDS cycle, alpha = 50000
soc_ini = [0.41     0.45     0.5      0.55     0.6      0.65     0.7];
dsoc  = [  0.1340   0.0968   0.0350  -0.0030  -0.0493  -0.1059  -0.1531];
mpg = [   48.0838  49.7781  53.1696  53.2151  54.9770  58.6879  61.5530];

figure(3); clf; hold on;
h1 = plot(dsoc, mpg, 'o', 'markerf', 'b', 'markersize', 4);
xlim([-0.2 0.2]);
ylim([30 70]);
grid on
set(gca, ...
    'fontsize'   , 8         , ...
    'TickDir'    , 'out'     , ...
    'XColor'     , [.2 .2 .2], ...
    'YColor'     , [.2 .2 .2]);
xlabel('\Delta SOC', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
ylabel('mpg', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);

% linear curve fit
p = polyfit(dsoc,mpg,1);
x_range = -0.2:0.01:0.2;
y_range = x_range*p(1) + p(2);
h2 = plot(x_range, y_range, 'r', 'linewidth', 1);
text(0, 55, ['Eq: y = ', num2str(p(1)), 'x + ' num2str(p(2))], 'FontName', 'Calibri', 'fontsize', 12);

legend([h1 h2], 'Data', 'Linear Fit');
set(legend, 'fontsize', 10);
set(legend, 'FontName', 'Estrangelo Edessa');

title('MPG with SOC Correction; UDDS Cycle; \alpha = 50000', 'fontsize', 14, 'color', 'k');

% export_fig UDDS_mpg -painters


%% ================================================================== %%
%% US06 cycle, alpha = 50000
soc_ini = [0.41     0.45     0.5      0.55     0.6      0.65     0.7];
dsoc  = [  0.1365   0.0964   0.0424  -0.0044  -0.0617  -0.0986  -0.1546];
mpg = [   33.8712  35.5141  36.3359  37.0915  38.0073  38.7006  40.2388];

figure(4); clf; hold on;
h1 = plot(dsoc, mpg, 'o', 'markerf', 'b', 'markersize', 4);
xlim([-0.2 0.2]);
ylim([30 70]);
grid on
set(gca, ...
    'fontsize'   , 8         , ...
    'TickDir'    , 'out'     , ...
    'XColor'     , [.2 .2 .2], ...
    'YColor'     , [.2 .2 .2]);
xlabel('\Delta SOC', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);
ylabel('mpg', 'FontName', 'Segoe UI Symbol', 'fontsize', 11);

% linear curve fit
p = polyfit(dsoc,mpg,1);
x_range = -0.2:0.01:0.2;
y_range = x_range*p(1) + p(2);
h2 = plot(x_range, y_range, 'r', 'linewidth', 1);
text(0, 55, ['Eq: y = ', num2str(p(1)), 'x + ' num2str(p(2))], 'FontName', 'Calibri', 'fontsize', 12);

legend([h1 h2], 'Data', 'Linear Fit');
set(legend, 'fontsize', 10);
set(legend, 'FontName', 'Estrangelo Edessa');

title('MPG with SOC Correction; US06 Cycle; \alpha = 50000', 'fontsize', 14, 'color', 'k');

% export_fig US06_mpg -painters

