function [g,sig] = Filt_GWN(n,beta,alpha)
% Filt_GWN- Makes GWN of s.d beta low-pass filtered
%  Usage
%    sig = Fig1(n,beta,k)
%  Inputs
%    beta	standard deviation
%    n	desired signal length
%    alpha	low-pass filter parameter.
%  Outputs
%    sig    1-d signal
%

sig=GWN(n,beta);
g=zeros(1,n);
lim=alpha*n;
mult=pi/(2*alpha*n);
g(1:fix(lim))=(cos(mult*(1:fix(lim)))).^2;
g((n/2+1):n)=g((n/2):-1:1);
g = rnshift(g,n/2);
g=g/norm(g);
sig=iconv(g,sig);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
