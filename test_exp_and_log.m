% Examing exponential and natural log
clear all; clc; close all;

x = 0.1 : 0.01 : 5;

figure(1); clf;

% exp(x)
y1 = exp(x);
subplot(2,3,1); plot(x, y1); grid on; title('e^x');

% exp(1/x)
y2 = exp(1./x);
subplot(2,3,2); plot(x, y2); grid on; title('e^(^1^/^x^)');

% exp(-1/x)
y3 = exp(-1./x);
subplot(2,3,3); plot(x, y3); grid on; title('e^(^-^1^/^x^)');

%ln(x)
y4 = log(x);
subplot(2,3,4); plot(x, y4); grid on; title('ln(x)');

% ln(1/x)
y5 = log(1./x);
subplot(2,3,5); plot(x, y5); grid on; title('ln(1/x)');

set(gcf, 'units', 'inch', 'pos', [8.3750    1.7917   10.6146    6.0313]);

