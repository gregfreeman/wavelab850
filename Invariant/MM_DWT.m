function dwtm = MM_DWT(dwt,threshold);

 [n,nscales] = size(dwt);
 D = nscales-1;
 J0 = D-1;
 m = dwt(:,2:nscales); 
 dwtm(:,2:nscales) = ModulusMaxima(m,1,1,threshold);
 dwtm(:,1) 	   = ones(n,1);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
