% mefig401 -- Multi-Resolution Filter Bank output, object "Ramp"
%
% As described in the text, the coefficients of the segmented
% wavelet transform differ from the unsegmented transform only
% in a few coefficients near the segmentation point.  The multi-
% resolution filter bank described in the text calculates exactly
% those coefficients which differ.  Here we show its output
% for object "Ramp".  The output is localized to sites near
% the discontinuity.
%
	global Ramp
%
	L = 4; D = 2;
	[R2,P2] = MakeAIRightFilter(2);
%
	ECoeff  = FastAllSeg(Ramp,L,D,R2);
%
m = max(max(abs(ECoeff)));
%
	sz = size(ECoeff);
	nl = sz(2)./3; 
	w = zeros(1,sz(2));
	[n,J] = dyadlength(Ramp);
	for i=1:nl,
	   w(1+3*(i-1)) =  -J + i;
	   w(2+3*(i-1)) =  -J + i + .2;
	   w(3+3*(i-1)) =  -J + i + .4;
	end
	offset = ones(sz(1),1) * w;
	t      = (1:sz(1)) ./sz(1);
	%clf; 
    %subplot(111);
	LockAxes([0 1 -J -L+1]);
	plot(t,((1/m) .* ECoeff)+offset);
	title('4.1 Multi-Resolution Filter Bank nu_{j,l}(t)')
	ylabel('j')
	xlabel('t')
	UnlockAxes;


%  
% Prepared for the paper Minimum Entropy Segmentation 
% Copyright (c) 1994 David L. Donoho
%  
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
