clear;
close all;
clc;
format compact;

deg2rad = 2*pi/360;

deg_label = 0:90:360;

rtr_ini = 3760;
rtr_label = deg_label/360*4096 + rtr_ini;
rtr_label(rtr_label>4096) = rtr_label(rtr_label>4096) - 4096;

deg_zero = deg_label(2:end) - 15;
rtr_zero = deg_zero/360*4096 + rtr_ini;
rtr_zero(rtr_zero>4096) = rtr_zero(rtr_zero>4096) - 4096;

%% ========================================================================
amp = 0.45;

% The correct amplitude of id & iq
deg = 0:5:360;
d = 1 + amp*cos(2*deg*deg2rad);
q = amp*sin(2*deg*deg2rad);

 % Error due to friction
deg2 = deg + 15;
d2 = 1 + amp*cos(2*deg2*deg2rad);
q2 = amp*sin(2*deg2*deg2rad);

% Discrepancy due to dq-coord definition (these are the experimental results)
deg3 = deg2 + 90;
d3 = 1 + amp*cos(2*deg3*deg2rad);
q3 = abs(q2);

% % ==============================
% figure(100); clf;
% subplot(2,1,1); hold on; box on;
% plot(deg, d, 'o-');
% plot([0 360], [1 1], 'color', [1 1 1]*0.7);
% grid on;
% xlim([-3 363]);
% set(gca, 'xtick', 0:45:360);
% ylabel('Amplitude of id');
% 
% subplot(2,1,2); hold on; box on;
% plot(deg, q, 'o-');
% grid on;
% xlim([-3 363]);
% set(gca, 'xtick', 0:45:360);
% ylim([-1 1]*0.5);
% set(gca, 'ytick', -0.5:0.1:0.5);
% ylabel('Amplitude of iq');
% 
% % ==============================
% figure(101); clf;
% subplot(2,1,1); hold on; box on;
% plot(deg, d2, 's-');
% plot([0 360], [1 1], 'color', [1 1 1]*0.7);
% grid on;
% xlim([-3 363]);
% set(gca, 'xtick', 0:45:360);
% ylabel('Amplitude of id');
% title('Shift by 15 deg (Friction)');
% 
% subplot(2,1,2); hold on; box on;
% plot(deg, q2, 's-');
% grid on;
% xlim([-3 363]);
% set(gca, 'xtick', 0:45:360);
% ylim([-1 1]*0.5);
% set(gca, 'ytick', -0.5:0.1:0.5);
% ylabel('Amplitude of iq');

% % ==============================
% figure(102); clf;
% subplot(2,1,1); hold on; box on;
% plot(deg, d3, 'x-');
% plot([0 360], [1 1], 'color', [1 1 1]*0.7);
% grid on;
% xlim([-3 363]);
% set(gca, 'xtick', 0:45:360);
% ylabel('Amplitude of id');
% title('Shift by 90 deg (dq-Cord. Definition)');
% 
% subplot(2,1,2); hold on; box on;
% plot(deg, q3, 'x-');
% grid on;
% xlim([-3 363]);
% set(gca, 'xtick', 0:45:360);
% ylim([-1 1]*0.5);
% set(gca, 'ytick', -0.5:0.1:0.5);
% ylabel('Amplitude of iq');


%% ========================================================================
% % Creat abnormality as reference
% d3(1) = d3(1)+0.075; d3(16) = d3(16)+0.05;
% q3(1) = q3(1)+0.075; q3(7)  = q3(7) +0.05; 

figure(1); clf;
subplot(2,1,1); hold on; box on;
plot(deg, d3, 'x-');
plot(deg(1), d3(1), 'sk', 'linewidth', 1);
plot([0 360], [1 1], 'color', [1 1 1]*0.7);
grid on;
xlim([-3 363]);
set(gca, 'xtick', 0:45:360);
ylabel('Amplitude of id');
title('Measurements');

subplot(2,1,2); hold on; box on;
plot(deg, q3, 'x-');
plot(deg(1), q3(1), 'sk', 'linewidth', 1);
grid on;
xlim([-3 363]);
set(gca, 'xtick', 0:45:360);
ylim([-1 1]*0.5);
set(gca, 'ytick', -0.5:0.1:0.5);
ylabel('Amplitude of iq');

for i = 1:length(deg_label)
    text(deg_label(i), -0.1, num2str(rtr_label(i)), 'rotation', 90, 'horizontalalignment', 'center');
end
for i = 1:length(deg_zero)
    text(deg_zero(i), -0.1, num2str(rtr_zero(i), '%4.0f'), 'color', [1 0.5 0.35], 'rotation', 90, 'horizontalalignment', 'center');
end

% % ==============================
% % Shift 15 deg to correct friction
% d4 = circshift(d3, 3, 2);
% q4 = circshift(q3, 3, 2);
% 
% figure(2); clf;
% subplot(2,1,1); hold on; box on;
% plot(deg, d4, 'x-');
% plot(deg(1)+15, d3(1), 'sk', 'linewidth', 1);
% plot([0 360], [1 1], 'color', [1 1 1]*0.7);
% grid on;
% xlim([-3 363]);
% set(gca, 'xtick', 0:45:360);
% ylabel('Amplitude of id');
% 
% subplot(2,1,2); hold on; box on;
% plot(deg, q4, 'x-');
% plot(deg(1)+15, q3(1), 'sk', 'linewidth', 1);
% grid on;
% xlim([-3 363]);
% set(gca, 'xtick', 0:45:360);
% ylim([-1 1]*0.5);
% set(gca, 'ytick', -0.5:0.1:0.5);
% ylabel('Amplitude of iq');
% 
% for i = 1:length(deg_label)
%     text(deg_label(i) + 15, -0.1, num2str(rtr_label(i)), 'rotation', 90, 'horizontalalignment', 'center');
% end
% for i = 1:length(deg_zero)
%     text(deg_zero(i) + 15, -0.1, num2str(rtr_zero(i), '%4.0f'), 'color', [1 0.5 0.35], 'rotation', 90, 'horizontalalignment', 'center');
% end
% 
% % ==============================
% % Shift 90 deg to correct dq-coord definition
% d5 = circshift(d4, 18, 2);
% q5 = circshift(q4, 18, 2);
% 
% figure(3); clf;
% subplot(2,1,1); hold on; box on;
% plot(deg, d5, 'x-');
% plot(deg(1)+15+90, d3(1), 'sk', 'linewidth', 1);
% plot([0 360], [1 1], 'color', [1 1 1]*0.7);
% grid on;
% xlim([-3 363]);
% set(gca, 'xtick', 0:45:360);
% ylabel('Amplitude of id');
% 
% subplot(2,1,2); hold on; box on;
% plot(deg, q5, 'x-');
% plot(deg(1)+15+90, q3(1), 'sk', 'linewidth', 1);
% grid on;
% xlim([-3 363]);
% set(gca, 'xtick', 0:45:360);
% ylim([-1 1]*0.5);
% set(gca, 'ytick', -0.5:0.1:0.5);
% ylabel('Amplitude of iq');
% 
% for i = 1:length(deg_label)
%     text(deg_label(i) + 15 + 90, -0.1, num2str(rtr_label(i)), 'rotation', 90, 'horizontalalignment', 'center');
% end
% for i = 1:length(deg_zero)
%     text(deg_zero(i) + 15 + 90, -0.1, num2str(rtr_zero(i), '%4.0f'), 'color', [1 0.5 0.35], 'rotation', 90, 'horizontalalignment', 'center');
% end
