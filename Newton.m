function [xc, fEvals] = Newton(f, xo, delta, fEvalMax)
% this function finds the closest zero of a given function f based on the
% initial point xo
% it loops until the function is less than delta, which is a small input
% value
%in the case that it never reaches zero, the function stops after fEvalMax
%iterations
%the output is the x cooridnate of the zero xc and the number of
%iterations, fEvals

h = 10^-6;
fEvals = 0;

while abs(f(xo)) > delta && fEvals < fEvalMax
    f_prime_x = (f(xo + h) - f(xo - h))/(2*h);
    xc = xo - (f(xo)/f_prime_x);
    xo = xc;
    fEvals = fEvals + 1;
end
