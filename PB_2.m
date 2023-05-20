%% Problem 2 Time!
% options
make    = 1;
cyl_cat = 1;
data1   = readcell('Monthly_Transportation_Statistics_modified.xlsx');
data    = readmatrix('Monthly_Transportation_Statistics_modified.xlsx');
% Make: Buick, Cadillac, Chevrolet, Pontiac, SAAB, Saturn
carMake = data1(2:end,3);
x3p     = strcmp(carMake, 'Cadillac');
x3pp    = strcmp(carMake, 'Chevrolet');
x3ppp   = strcmp(carMake, 'Pontiac');
x3pppp  = strcmp(carMake, 'SAAB');
x3ppppp = strcmp(carMake, 'Saturn');
makeMat = [x3p, x3pp, x3ppp, x3pppp, x3ppppp];
% Cylinders: 4, 6, 8
x7p     = data(:,7) == 6;
x7pp    = data(:,7) == 8;
y_car   = data(:,5);
A_car   = [data(:,[10:14,20:85,87:107,110:123,125:128,130,132,134,135,137])];
if (cyl_cat)
    A_car = [A_car, x7p, x7pp];
else
    A_car = [A_car, data(:,7)];
end
if (make)
    A_car = [A_car, makeMat];
end
[coeffs, A_found, R_sq] = func_fwd_regression(A_car, y_car);
% Plotting
y=[ones(size(y_car)), A_found];
y_mod   = [ones(size(y_car)) A_car]*coeffs';

figure(1);
clf;
plot(y_car, 'o');
hold on;
plot(y_mod, '-');
ylabel("Highway Fatalities");
legend("Data", "Modeled");

figure(2);
clf;
plot(data(:,8), y_car, "o");
xlabel("Liter (L)");
ylabel("Car Price ($)");