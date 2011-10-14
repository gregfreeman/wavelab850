% mifig21 -- Visualize Median Interpolation, D=2.
%
% A quadratic polynomials which match the medians of 3 neighboring 
% cells. The polynomial is used to impute the medians at the
% next finer scale.
% 
% The default is m1=0,m2=1,m3=1.3 is this figure, you can change
% to any values as you wish.
% 

scriptname = 'mifig21';

% Display Block Averages as Histogram Bars
%

dat = [3.75 2.5 2.2];
ord = [0 1 2];
t = [ord; ord; ord+1; ord+1 ]; t = t(:);
base = 0.;
w = [base + (dat-dat); dat; dat; base + (dat-dat) ]; w = w(:);
plot(t,w,'-.'); hold on;

[m21,m22,m23,a,b,c,rule] = QuadMedRef(dat(1),dat(2),dat(3));

% display polynomial
domain = 0:.01:3;
plot(domain, a+b*domain + c*domain.^2);

% display imputed value
impute = [m21,m22,m23];
ord = [1 1+1/3 1+2/3];
t = [ord; ord; ord+1/3; ord+1/3 ]; t = t(:);
base = 0.;
w = [base + (impute-impute); impute; impute; base + (impute-impute) ]; w = w(:);
plot(t,w);

title('Medians, Polynomial Fit, Medians Imputed to Finer Scale')

xstar = -b/(2*c); minimum = a+b*xstar+c*xstar^2;
plot([xstar, xstar], [0,minimum],'r--');

plot(xstar, 0, 'r.','MarkerSize',25);
text(xstar-.05,-.16,'x*')

RegisterPlot(scriptname, '{R}')

%
% Copyright (c) 1996.  David Donoho and Thomas P.Y. Yu
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
