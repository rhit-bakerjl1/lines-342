close;
clear;
clc;

% Declaring Variables
y   = [15.6; 21.7; 3.1; 14.7; 6.9; 16.1; 7.5; 16.1; 20.2; 13.3; 15.0; 23.3];
x1  = [2.0; 3.6; 0.9; 2.4; 0.1; 2.6; 0.7; 1.0; 2.4; 1.9; 2.3; 3.9];
x2  = [4.7; 5.7; 1.6; 4.8; 4.4; 6.0; 2.6; 5.7; 4.5; 5.0; 4.8; 6.9];
x3  = [2.9; 4.9; 1.4; 3.3; 1.6; 3.7; 1.6; 3.0; 3.1; 3.4; 3.3; 4.8];

% Solve for Values
% A   = [ones(size(y)), x1, x2, x3];
% [alpha, ~, ~, ~, stats]     = regress(y,A);
A   = [x1, x2, x3];
mdl     = fitlm(A, y);
A_new   = [x1, x2];
mdl2    = fitlm(A_new, y);

% Project 1 Time!
data    = readmatrix('car_data.xls');
y_car   = data(:,1);
A_car   = data(:,[2,7:12]);
[coeffs, A_found, R_sq] = func_fwd_regression(A_car, y_car);

% Plotting
y_mod   = [ones(size(y_car)), A_found]*coeffs';
figure(1);
clf;
plot(y_car, 'o');
hold on;
plot(y_mod);
ylabel("Car Price");
