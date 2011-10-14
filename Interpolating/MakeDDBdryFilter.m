function [LEFilt,REFilt] = MakeDDBdryFilter(D)
% MakeDDBdryFilter -- Edge filters, Interpolating (Deslauriers-Dubuc) Refinement
%  Usage
%    [LEFilt,REFilt] = MakeDDBdryFilter(D)
%  Inputs
%    D         Degree of polynomial for interpolation.
%              Must be an odd integer >= 3.
%  Outputs
%    LEFilt    Left Edge Interpolating Filter
%    REFilt    Right Edge Interpolating Filter
%
%  Description
%    Calculates interpolating filters of various orders
%    which may be used with FWT_DD and related tools.
%
%  See Also
%    DDRefine, FWT_DD, IWT_DD
%
if rem(D,2) ~= 1 | D < 3,
   EdgeFilt = [];
else

	% step 1. Moment matrix Mmat
	Mmat = zeros(D+1,D+1);
	D2 = floor(D/2);
	for kp1 = 1:(D+1),
		for lp1 = 0:D,
			Mmat(lp1+1,kp1) = lp1^(kp1-1);
	   end
	end
	Minv = inv(Mmat);

	% step 2. Left Imputation matrx Jmat
	Jmat = zeros(D-1,D+1);
	for kpp1 = 1:(D+1),
	  for kp1 = 1:(D-1),
			Jmat(kp1,kpp1) = ((kp1-1)/2)^(kpp1-1);
	  end
	end

	% step 3. Compose for Left prediction matrix:
	Pmat = Jmat * Minv ;
	LEFilt = Pmat;

	% step 4. Right Imputation matrx Jmat
	Jmat = zeros(D-1,D+1);
	for kpp1 = 1:(D+1),
	  for kp1 = 1:(D-1),
			Jmat(kp1,kpp1) = ((kp1-2)/2)^(kpp1-1);
	  end
	end

	% step 5. Compose for prediction matrix:
	Pmat = Jmat * Minv ;
	REFilt = Pmat;
end
    
    
%
% For Article "Interpolating Wavelet Transforms"
% Copyright (c) 1993. David L. Donoho
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
