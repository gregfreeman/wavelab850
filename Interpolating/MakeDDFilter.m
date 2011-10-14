function Filt = MakeDDFilter(D)
% MakeDDFilter -- Filter for interpolating (Deslauriers-Dubuc) Refinement
%  Usage
%    Filt = MakeDDFilter(D)
%  Inputs
%    D         Degree of polynomial for interpolation.
%              Must be an odd integer >= 3.
%  Outputs
%    Filt      Interpolating Filter suitable for use by
%              DDRefine, FWT_DD, IWT_DD,  etc.
%
%  Description
%    Calculates interpolating filters of various orders
%    which may be used with FWT_DD and related tools.
%
%  See Also
%    DDRefine, FWT_DD, IWT_DD
%
	if rem(D,2) ~= 1 | D < 1,
	   Filt = [];
	else

		% step 1. Moment matrix Mmat
		D2 = floor(D/2);
		Mmat = zeros(D+1,D+1);
		for kp1 = 0:(D),
		   for lp1 = (-D2):(D2+1),
				Mmat(lp1+D2+1,kp1+1) = lp1^kp1;
		   end
		end
		Minv = inv(Mmat);

		% step 2. Imputation matrx Jmat
		Jmat = zeros(2,D+1);
		for kpp1 = 0:(D),
		  for kp1 = 1:2,
				Jmat(1,kpp1+1) = 0. .^ kpp1;
				Jmat(2,kpp1+1) = .5 .^ kpp1;
		  end
		end

		% step 3. Compose for prediction matrix:
		Pmat = Jmat * Minv ; Pmat = Pmat(2:-1:1,:);
		Filt = Pmat(:);
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
