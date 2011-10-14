function [fnew,pnew,rnew,Lp] = ConjGrad(f,p,pold,r,u,J0,Lpold);

%Lp    	= L(u,FWT_Dyad(p,J0));
Lp    	= L(u.*FWT_ATrou(p,J0));
lambda 	= (r'*p) / (p'*Lp);
fnew 	= f + lambda * p;
rnew	= r - lambda * Lp;
pnew	= Lp - (Lp'*Lp) / (p'*Lp) * p;
if ~(pold == 0),
    pnew = pnew  - (Lp'*Lpold) / (pold'*Lpold) * pold;
end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
