function [EdgeFilt,PolyFilt] = MakeAIRightFilter(D)
% MakeAIRightFilter -- Make Average Interpolating Right Filter
%  Usage
%    [EdgeFilt,PolyFilt] = MakeAIRightFilter(D)
%
%  Description
%    Fit a Polynomial to the D+1 boxcar
%    averages strictly to the right of you.
%

if rem(D,2) | D < 2,
	EdgeFilt = [];
else
	% step 1. Moment matrix Mmat
	Mmat = zeros((D+1),D+1);
	for kp1 = 1:(D+1),
	   for lp1 = 1:(D+1),
	        Mmat(lp1,kp1) = ((lp1+.5)^kp1 - (lp1-.5)^kp1)/kp1;
	   end
	end
	PolyFilt = inv(Mmat'*Mmat)*Mmat';
	% step 2. Imputation functional
	Jmat = zeros(D,D+1);
	for kpp1 = 1:(D+1),
	    for kp1=1:D,
	     Jmat(kp1,kpp1) = 2 * ((kp1/2+.5)^kpp1 - (kp1/2)^kpp1)/(kpp1);
	    end
	end
	% step 3. Compose for prediction matrix:
	Pmat = Jmat *  PolyFilt;
	EdgeFilt = Pmat;
end
	
	
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
