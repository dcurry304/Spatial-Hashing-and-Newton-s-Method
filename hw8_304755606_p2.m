%Problem 2 Newton's Method
%David Curry
%ID: 304755606
clear all;
clc;
%define initial conditions
change = 0.01;
delta = 10^-3;
fEvalMax = 50;
xo = 1.43;
xf = 1.71;
%define the function to find zeros for
f = @(x) 816*x^3 - 3835*x^2 + 6000*x - 3125;
%find zeros for different xo values
for k = xo:change:xf
    xo = k;
    %call the function to find the zero
    [xc, fEvals] = Newton(f,xo,delta,fEvalMax);
    %print recults each iteration
    fprintf('xo = %4.2f, evals = %2.0f, xc = %.6f\n',xo, fEvals,xc);
end
    