function wc = FWT_SegAI(x,L,D,F,EF,t)
% FWT_SegAI -- Forward Segmented Transform
%  Usage
%    wc = FWT_SegAI(x,L,D,F,EF,t)
%

[n,J] = dyadlength(x);
wc = zeros(1,n);
sig = x;
for j=(J-1):-1:L ,
   [beta,alfa] = SAIDyadUp(sig,D,F,EF,t,j);
   wc(dyad(j)) = alfa;
   sig = beta;
end
wc(1:2^L) = sig;
%

   
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
