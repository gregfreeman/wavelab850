function [x,y,zz] = NoiseFrac(f,rho,alpha)

sig = std(f);
x = (rho/sig).*f;

zz = fbm(alpha,length(f));
zz = zz ./ std(zz);

y = x + zz;

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
