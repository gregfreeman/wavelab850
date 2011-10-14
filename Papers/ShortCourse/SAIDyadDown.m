function afine = SAIDyadDown(beta,alfa,D,F,EF,t,j)
% SAIDyadDown -- SAI Dyad Down
%  Usage
%    afine = SAIDyadDown(beta,alfa,D,F,EF,t,j)
%

n = length(beta);
ahat = SegRefine(beta,D,F,EF,t,j);
adif =  [(-alfa) ; alfa ];
adif = adif(:)';
afine = ahat + adif;
afine = afine ./sqrt(2);
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
