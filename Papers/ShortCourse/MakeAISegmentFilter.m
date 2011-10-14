function SegFilt = MakeAISegmentFilter(D,eta0)
% MakeAISegmentFilter -- coefficients for segmented B/W Transform
%  Usage
%    SegFilt = MakeAISegmentFilter(D,eta0)
%

if rem(D,2) | D < 2,
   EdgeFilt = [];
else
% step 0. Get the rounded representation
if eta0 > .5 ,  
   flip =1; 
   eta0 = 1-eta0; 
else 
   flip = 0; 
end;
% step 1. Moment matrix Mmat
Mmat = zeros(2*D+2,2*D+2);
for kp1 = 1:(D+1),
   for lp1 = (-D):0,
        Mmat(D+1+lp1,kp1) = (lp1^kp1 - (lp1-1)^kp1)/kp1;
   end
end
for kp1 = 1:(D+1),
   for lp1 = 2:(D+1),
        Mmat(D+1+lp1,D+1+kp1) = (lp1^kp1 - (lp1-1)^kp1)/kp1;
   end
end
for kp1 = 1:(D+1),
   Mmat(D+2,kp1)     = (eta0^kp1)/kp1;
   Mmat(D+2,D+1+kp1) = (1 - eta0^kp1)/kp1;
end
Minv = inv(Mmat);
% step 2. Imputation matrx Jmat
Jmat = zeros(2*D+2,2*D+2);
for kpp1 = 1:(D+1),
   for lp1 = (-D+1):0,
        Jmat(D+lp1,kpp1) = 2 * ((lp1/2)^kpp1 - (lp1/2 - .5)^kpp1)/(kpp1);
  end
end
for kpp2 = 1:(D+1),
   for lp1 = 2:(D+2),
        Jmat(D+lp1,D+1+kpp2) = 2 * ((lp1/2)^kpp2 - (lp1/2 - .5)^kpp2)/(kpp2);
  end
end
for kpp1 = 1:(D+1),
   Jmat(D+1,kpp1)     =  2 * (eta0^kpp1)/kpp1;
   Jmat(D+1,D+1+kpp1) =  2 * (.5^kpp1 - eta0^kpp1)/kpp1 ;
end
% step 3. Compose for prediction matrix:
Pmat = Jmat * Minv ;
if flip==0,
   SegFilt = Pmat;
else
   SegFilt = Pmat((2*D+2):-1:1,(2*D+2):-1:1);
end
end


    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
