function beta = IWT_SegAI(w,L,D,F,EF,t)
% IWT_SegAI -- Inverse Segmented Transform
%  Usage
%    beta = IWT_SegAI(w,L,D,F,EF,t)
%

[n,J] = dyadlength(w);
beta = w(1:(2^L));
for j=L:(J-1) ,
   beta = SAIDyadDown(beta,w(dyad(j)),D,F,EF,t,j);
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
