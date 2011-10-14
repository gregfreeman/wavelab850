function Noisysig = GWNoisy(data,sigma)
%  GWNoisy- Addition of a Gaussian White Noise
%  Usage
%    Noisysig = GWNoisy(sig,sigma)
%  Inputs
%    sig        Input signal
%    sigma   s.d for additive Gaussian White Noise
%  Outputs
%    Noisysig    1-d signal
%

n=length(data);
Noise=GWN(n,sigma);
Noisysig=Noise+data;

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
