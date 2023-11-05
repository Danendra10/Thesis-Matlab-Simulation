% Try3dLinear
% Linear equation: y = mx + b
% To calculate the z in x,y plane, the updated equation is:
% z = m1*x + m2*y + b
% where m1 and m2 is equal

% main code
clear all; 
close all; 
clc;

TOTAL_ = 200;

% load data
[x, y] = meshgrid(linspace(0, TOTAL_, TOTAL_), linspace(0, TOTAL_, TOTAL_));

% calculate z
z = 2*x + 2*y + 4;

% plot data
figure(1)
surf(x,y,z)
xlabel('x')
ylabel('y')
zlabel('z')
title('Original Data')

% Parabolic Equation y = x^2
% To calculate the z in x,y plane, the updated equation is:
% z = m1*x^2 + m2*y^2 + b
% where m1 and m2 is equal

% main code

% calculate z
z_par = 2*x.^2 + 2*y.^2 + 4;

% plot data
figure(2)
surf(x,y,z_par)
xlabel('x')
ylabel('y')
zlabel('z')
title('Parabolic Data')

% Exponential Equation y = e^x
% To calculate the z in x,y plane, the updated equation is:
% z = m1*e^x + m2*e^y + b
% where m1 and m2 is equal

% main code

% calculate z
z_exp = 2*exp(x) + 2*exp(y) + 4;

% plot data
figure(3)
surf(x,y,z_exp)
xlabel('x')
ylabel('y')
zlabel('z')
title('Exponential Data')

% Paraboloid Equation y = x^2 + y^2
% To calculate the z in x,y plane, the updated equation is:
% z = m1*x^2 + m2*y^2 + b
% where m1 and m2 is equal

% main code

% calculate z
z_parab = x.^2 + y.^2 + 4;

% plot data
figure(4)
surf(x,y,z_parab)
xlabel('x')
ylabel('y')
zlabel('z')
title('Paraboloid Data')