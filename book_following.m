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
[coeffs, A_found, R_sq] = func_fwd_regression(A, y);

%% Project 1 Time!
% options
make    = 0;
cyl_cat = 1;
%data1   = readcell('air_data.xls');
data    = readmatrix('air_data.csv');
% Make: Buick, Cadillac, Chevrolet, Pontiac, SAAB, Saturn
%carMake = data1(2:end,3);
%x3p     = strcmp(carMake, 'Cadillac');
%x3pp    = strcmp(carMake, 'Chevrolet');
%x3ppp   = strcmp(carMake, 'Pontiac');
%x3pppp  = strcmp(carMake, 'SAAB');
%x3ppppp = strcmp(carMake, 'Saturn');
%makeMat = [x3p, x3pp, x3ppp, x3pppp, x3ppppp];
% Cylinders: 4, 6, 8
x7p     = data(:,7) == 6;
x7pp    = data(:,7) == 8;
y_air   = data(:,1);
A_air   = [data(:,2:end)];
if (cyl_cat)
    %A_car = [A_car, x7p, x7pp];
else
    %A_car = [A_car, data(:,7)];
end
if (make)
    A_car = [A_car, makeMat];
end
[coeffs, A_found, R_sq] = func_fwd_regression(A_air, y_air);
% Plotting
y=[ones(size(y_air)), A_found];
y_mod   = [ones(size(y_air)) A_air]*coeffs';

figure(1);
clf;
plot(y_air, '-');
hold on;
plot(y_mod);
ylabel("Total Injuries");
legend("Data", "Modeled");

%figure(2);
%clf;
%plot(data(:,8), y_air, "o");
%xlabel("Liter (L)");
%ylabel("Total Injuries");
