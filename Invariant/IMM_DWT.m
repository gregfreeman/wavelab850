function f = IMM_DWT(maxima);
% MaxRecons - Inverse Reconstruction of signals from Modulus
%	      Maxima of a Dyadic Wavelet Transform
% Usage f = MaxRecons(maxima);
% Inputs 
%	maxima 		n times b matrix storing the positions
%			and values of a dyadic wavelet transform
% Outputs
%	f		signal, size n
% References
%   Mallat's book, section 6.3.2
[n,b] = size(maxima);

u = (abs(maxima) > 0);

J     = log2(n);
D     = b-1;
J0    = J-D;

p     = L(maxima);

f     = zeros(n,1);
pold  = zeros(n,1);
r     = p;
Lpold = zeros(n,1);
flag  = 1;
i = 1;
imax = 10;
while (flag==1) & (i<imax),
  i = i+1;
  [fnew,pnew,rnew,Lp] = ConjGrad(f,p,pold,r,u,J0,Lpold);
  f     = fnew;
  pold  = p;
  p     = pnew;
  r     = rnew;
  Lpold = Lp;
end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
