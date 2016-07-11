%% R. L. Williams and D. A. Lawrence, Linear state-space control systems: John Wiley & Sons, 2007.
%% A single-input, single-output rotational mechanical system
%% (see P.30, P.80, P.280, P.398)
%%
%% Simulations include:
%%   1.continuous open-loop dynamics
%%   2.discrete open-loop dynamics
%%   3.continuous closed-loop dynamics (pole-placement)
%%   4.discrete closed-loop dynamics (pole-placement)
%%   5.continuous LQR
%%   6.discrete LQR
%%   7.Dynamic Programming
%% (not every case is shown in figures)

clear all
close all
clc

J = 1;
b = 4;
kR = 40;

Ts = 0.05; % sampling time [sec]

%% ================================================================== %%
%% open-loop state-space realization
%% two states: x1: theta, x2: theta dot
A = [0 1;
    -kR/J -b/J];
B = [0;
    1/J];
C = [1 0];
D = 0;

OL_sys = ss(A,B,C,D);

t = 0:Ts:4;
U = zeros(size(t));
x0 = [0.4;
      0.2];

[Yo, t, Xo] = lsim(OL_sys, U, t, x0);

%% ==============================
%% desired closed-loop dynamics
PO = 3; % overshoot percentage
ts = 0.7; % settling time [sec]

zeta = log(PO/100)/sqrt(pi^2 + log(PO/100)^2); % damping ratio
wn = 4/(zeta*ts); % natural frequency

%% generic second-order frequency
num2 = wn^2; % numerator
den2 = [1 2*zeta*wn wn^2]; % denominator
CL_sys_pole = roots(den2); % desired eigenvalues

%% pole pacement
K = place(A,B,CL_sys_pole)

%% closed-loop state space
Ac = A-B*K;
Bc = B;
Cc = C;
Dc = D;

CL_sys = ss(Ac,Bc,Cc,Dc);
[Yc, t, Xc] = lsim(CL_sys, U, t, x0);

%% ==============================
%% LQR design
Q = 20*eye(2);
R = 1;
KLQR = lqr(A,B,Q,R)
ALQR = A-B*KLQR;
CL_sys_lqr = ss(ALQR,B,C,D);
[YLQR, t, XLQR] = lsim(CL_sys_lqr, U, t, x0);


%% ================================================================== %%
%% discrete-time system
n = 0:1:(4/Ts);

Ud = zeros(size(n));

[Ad, Bd] = c2d(A, B, Ts);
[Yod, Xod] = dlsim(Ad,Bd,C,D, Ud, x0);

%% ==============================
%% discrete pole placement
[Acd, Bcd] = c2d(Ac, Bc, Ts);
CL_dsys_pole = pole(ss(Acd, Bcd, Cc, Dc));
Kd = place(Ad,Bd,CL_dsys_pole)
[Ycd, Xcd] = dlsim(Ad-Bd*Kd,Bd,C,D, Ud, x0);

%% ==============================
%% discrete LQR design
KLQRd = dlqr(Ad,Bd,Q,R)
ALQRd = Ad-Bd*KLQR;
[YoLQRd, XLQRd] = dlsim(ALQRd,Bd,C,D, Ud, x0);


%% ================================================================== %%
%% ================================================================== %%
%% Optimal control (Dynamic Programming)
N = length(n);
x1_grid = -0.2:0.025:0.425;
x2_grid = -2:0.1:1;
u_grid = -1:0.2:3; % [1]x[21] vector

%% ==============================
%% step 1: transitional cost
tic;
disp('==============================');
disp('Starting Step 1 calculation');
L_table   = zeros(length(x1_grid), length(x2_grid), length(u_grid), length(n)); % [x1]x[x2]x[u]x[n]
x1n_table = zeros(length(x1_grid), length(x2_grid), length(u_grid), length(n)); % [x1]x[x2]x[u]x[n]
x2n_table = zeros(length(x1_grid), length(x2_grid), length(u_grid), length(n)); % [x1]x[x2]x[u]x[n]
for k = 1:N % loop for time
    for i = 1:length(x1_grid) % loop for x1
        x1 = x1_grid(i);
        for j = 1:length(x2_grid) % loop for x2
            x2 = x2_grid(j);
            
            xn = repmat(Ad*[x1;x2],1,length(u_grid)) +Bd*u_grid;
            
            x1n_table(i,j,:,k) = xn(1,:);
            x2n_table(i,j,:,k) = xn(2,:);
            L_table(i,j,:,k) = [x1;x2]'*Q*[x1;x2] + R*u_grid.^2;
        end % end of loop for x2
    end % end of loop for x1
end % end of loop for time
toc;

%% ==============================
%% step 2: cost-to-go
disp('Starting Step 2 calculation');
J_star  = zeros(length(x1_grid), length(x2_grid), N);
u_opt   = zeros(length(x1_grid), length(x2_grid), N);

k = N;
[X2,X1] = meshgrid(x2_grid, x1_grid);
J_star(:,:,k) = Q(1,1)*X1.^2 + Q(2,2)*X2.^2; % terminal cost

% for k = N-1:-1:1 % backward loop for time
%     for i = 1:length(x1_grid) % loop for x1
%         for j = 1:length(x2_grid) % loop for x2
%             x1n = squeeze(x1n_table(i,j,:,k));
%             x2n = squeeze(x2n_table(i,j,:,k));
%             x1n(x1n>max(x1_grid)) = max(x1_grid);
%             x1n(x1n<min(x1_grid)) = min(x1_grid);
%             x2n(x2n>max(x2_grid)) = max(x2_grid);
%             x2n(x2n<min(x2_grid)) = min(x2_grid);
%             J_temp = squeeze(L_table(i,j,:,k)) + ...
%                      interp2(x2_grid, x1_grid, J_star(:,:,k+1), x2n, x1n); %[1]x[1]
%             [opt_value, opt_id] = min(J_temp);
%             J_star(i,j,k) = opt_value;
%             u_opt(i,j,k) = u_grid(opt_id);
%         end
%     end
% end
% toc;

%% parallelization on interp2 (much faster!!)
for k = N-1:-1:1 % backward loop for time
    x1n_table(x1n_table>max(x1_grid)) = max(x1_grid);
    x1n_table(x1n_table<min(x1_grid)) = min(x1_grid);
    x2n_table(x2n_table>max(x2_grid)) = max(x2_grid);
    x2n_table(x2n_table<min(x2_grid)) = min(x2_grid);
    J_temp = L_table(:,:,:,k) + interp2(x2_grid, x1_grid, J_star(:,:,k+1), x2n_table(:,:,:,k), x1n_table(:,:,:,k)); % [x1]x[x2]x[u]
    [opt_value, opt_id] = min(J_temp,[],3);
    J_star(:,:,k) = opt_value;
    u_opt(:,:,k) = u_grid(opt_id);
end
toc;

%% ==============================
%% step 3: retrieve optimal solution
disp('Starting Step 3 calculation');
u_sim = zeros(1, N);
x1_sim = zeros(1, N);
x2_sim = zeros(1, N);

x1_sim(1) = x0(1);
x2_sim(1) = x0(2);
for k = 1:N-1
    u_sim(k) = interp2(x2_grid, x1_grid, u_opt(:,:,k), x2_sim(k), x1_sim(k));
    xn = Ad*[x1_sim(k);x2_sim(k)] + Bd*u_sim(k);
    x1_sim(k+1) = xn(1);
    x2_sim(k+1) = xn(2);
end

XoDP = [x1_sim
        x2_sim];
XoDP = XoDP';
toc;


%% ================================================================== %%
%% ================================================================== %%
%% compare state trajectory
figure(1); clf;
subplot(2,1,1); 
h1 = plot(n*Ts, XLQRd(:,1), 'go', 'linewidth', 1, 'markersize', 4); hold on;
h2 = plot(t, Xo(:,1), 'b', 'linewidth', 1);
h3 = plot(t, Xc(:,1), 'r', 'linewidth', 1);
h4 = plot(t, XLQR(:,1), 'color', [0 0.5 0], 'linewidth', 1);
h5 = plot(n*Ts, XoDP(:,1), 'mo', 'linewidth', 1, 'markersize', 4);

grid;
ylabel('{\itx}_1 (rad)');
xlim([0 4]);
ylim([-0.2 0.6]);
set(gca, 'ytick', -0.2:0.2:0.6);
title('State Trajectory');

legend([h2 h3 h4 h1 h5], ...
       'Open Loop', ...
       'Pole Placement', ...
       'LQR', ...
       'Discrete LQR', ...
       'DP');
set(legend, 'fontsize', 8);

subplot(2,1,2);
plot(n*Ts, XLQRd(:,2), 'go', 'linewidth', 1 , 'markersize', 4); hold on;
plot(t, Xo(:,2), 'b', 'linewidth', 1);
plot(t, Xc(:,2), 'r', 'linewidth', 1);
plot(t, XLQR(:,2), 'color', [0 0.5 0], 'linewidth', 1);
plot(n*Ts, XoDP(:,2), 'mo', 'linewidth', 1, 'markersize', 4);

grid
ylabel('{\itx}_2 (rad/s)');
xlabel('Time (sec)');
xlim([0 4]);
ylim([-2 1]);

%% ==============================
%% compare control effort
Uc = -K*Xc';
Ucd = -Kd*Xcd';
ULQR = -KLQR*XLQR';
ULQRd = -KLQRd*XLQRd';

figure(2); clf;
plot(n*Ts, ULQRd, 'go', 'linewidth', 1 , 'markersize', 4); hold on;
plot(t, Uc, 'r', 'linewidth', 1);
plot(t, ULQR, 'color', [0 0.5 0], 'linewidth', 1);
plot(n*Ts, u_sim, 'mo', 'linewidth', 1 , 'markersize', 4); 

ylabel('U (Nm)');
xlabel('Time (sec)');
xlim([0 4]);
ylim([-10 6]);
set(gca, 'ytick', -10:2:6);


% %% ================================================================== %%
% %% compare state trajectory (more cases)
% figure(3); clf;
% subplot(2,1,1);
% plot(t, Xo(:,1), 'b-', n*Ts, Xod(:,1), 'bo', ...
%      t, Xc(:,1), 'r-', n*Ts, Xcd(:,1), 'ro', ...
%      t, XLQR(:,1), 'g-', n*Ts, XLQRd(:,1), 'go', ...
%      n*Ts, XoDP(:,1), 'mo', ...
%      'linewidth', 1 , 'markersize', 4); 
% 
% grid;
% ylabel('{\itx}_1 (rad)');
% xlim([0 4]);
% ylim([-0.2 0.6]);
% set(gca, 'ytick', -0.2:0.2:0.6);
% title('State Trajectory');
% 
% legend('Continuous Open-Loop', 'Discrtet Open-Loop', ...
%        'Continuous Closed-Loop (Pole Placement)', 'Discrete Closed-Loop (Pole Placement)', ...
%        'Continuous LQR', 'Discrete LQR', ...
%        'Dynamic Programming');
% set(legend, 'fontsize', 8);
% 
% subplot(2,1,2);
% plot(t, Xo(:,2), 'b-', n*Ts, Xod(:,2), 'bo', ...
%      t, Xc(:,2), 'r-', n*Ts, Xcd(:,2), 'ro', ...
%      t, XLQR(:,2), 'g-', n*Ts, XLQRd(:,2), 'go', ...
%      n*Ts, XoDP(:,2), 'mo', ...
%      'linewidth', 1 , 'markersize', 4); 
% grid
% ylabel('{\itx}_2 (rad/s)');
% xlabel('Time (sec)');
% xlim([0 4]);
% ylim([-2 1]);
% 
% %% ==============================
% %% control effort (more cases)
% figure(4); clf;
% plot(t, Uc, 'r', n*Ts, Ucd, 'ro', ...
%      t, ULQR, 'g', n*Ts, ULQRd, 'go', ...
%      n*Ts, u_sim, 'mo' , 'markersize', 4); 
%  
% ylabel('U (Nm)');
% xlabel('Time (sec)');
% xlim([0 4]);
% ylim([-10 6]);
% set(gca, 'ytick', -10:2:6);
% title('Control Effort');
% 
% legend('Continuous Closed-Loop (Pole Placement)', 'Discrete Closed-Loop (Pole Placement)', ...
%        'Continuous LQR', 'Discrete LQR', ...
%        'Dynamic Programming');
% set(legend, 'fontsize', 8);

