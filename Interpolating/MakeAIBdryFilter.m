function EdgeFilt = MakeAIBdryFilter(D)
% MakeAIBdryFilter -- Edge filters for Average-Interpolating Wavelets
%  Usage
%    EdgeFilt = MakeAIBdryFilter(D)
%  Inputs
%    D         Degree of polynomial for average-interpolation.
%              Must be an even integer.
%  Outputs
%    EdgeFilt  Edge Filter suitable for use by
%              AIRefine, FWT_AI, IWT_AI, AIRefine2d, etc.
%  Description
%    Calculates average-interpolating filters of various orders
%    which may be used with FWT_AI and related tools.
%
%  See Also
%    AIRefine, FWT_AI, AIRefine2d
%

if rem(D,2) | D < 2,
   EdgeFilt = [];
else

	% step 1. Moment matrix Mmat
	Mmat = zeros(D+1,D+1);
	for kp1 = 1:(D+1),
	   for lp1 = 1:(D+1),
			Mmat(lp1,kp1) = (lp1^kp1 - (lp1-1)^kp1)/kp1;
	   end
	end
	Minv = inv(Mmat);

	% step 2. Imputation matrx Jmat
	Jmat = zeros(D,D+1);
	for kpp1 = 1:(D+1),
	  for kp1 = 1:(D),
			Jmat(kp1,kpp1) = 2 * ((kp1/2)^kpp1 - (kp1/2 - .5)^kpp1)/(kpp1);
	  end
	end

	% step 3. Compose for prediction matrix:
	Pmat = Jmat * Minv ;
	EdgeFilt = Pmat;
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
