function Filt = MakeAIFilter(D)
% MakeAIFilter --  Filters for Average-Interpolating Wavelets
%  Usage
%    Filt = MakeAIFilter(D)
%  Inputs
%    D         Degree of polynomial for average-interpolation.
%              Must be an even integer.
%  Outputs
%    Filt      Average-Interpolating Filter suitable for use by
%              AIRefine, FWT_AI, IWT_AI, AIRefine2d, etc.
%
%  Description
%    Calculates average-interpolating filters of various orders
%    which may be used with FWT_AI and related tools.
%
%  See Also
%    AIRefine, FWT_AI, AIRefine2d
%

if rem(D,2) | D < 2,
   Filt = [];
else

	% step 1. Moment matrix Mmat

	Mmat = zeros(D+1,D+1);
	for kp1 = 1:(D+1),
	   for lp1 = (-D/2+1):(D/2+1),
			Mmat(lp1+D/2,kp1) = (lp1^kp1 - (lp1-1)^kp1)/kp1;
	   end
	end
	Minv = inv(Mmat);

	% step 2. Imputation matrix Jmat
	Jmat = zeros(2,D+1);
	for kpp1 = 1:(D+1),
	  for kp1 = 1:2,
			Jmat(kp1,kpp1) = 2 * ((kp1/2)^kpp1 - (kp1/2 - .5)^kpp1)/(kpp1);
	  end
	end

	% step 3. Compose for prediction matrix:
	Pmat = Jmat * Minv ; Pmat = Pmat(2:-1:1,:);
	Filt = Pmat(:);

end
    
    
%
% For Article "Smooth Wavelet Decompositions with Blocky Coefficient Kernels"
% Copyright (c) 1993. David L. Donoho
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
