function B = GWN2(n,beta)
%  GWN2- Generation of 2-D Gaussian White NNoise
%  Usage
%    B=GWN2(n,beta)
%  Inputs   
%    n	size of datas
%    beta	standard deviation
%  Outputs
%    B	resulting noise
%

B=randn(n,n);
B=B*beta;

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
