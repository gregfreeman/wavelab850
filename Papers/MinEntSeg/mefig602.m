% mefig602 -- MultiResolution Filter Bank Output, Object "Bumps"
%
% Here we display the multi-resolution filter bank output for object
% "Bumps". Evidently most of the action in the coefficients happens
% near the peaks of the bumps.
%
% Note: this script uses objects computed in script mefig601.
%
	global ECoeff 
	global Bumps
%
	[R2,P2] = MakeAIRightFilter(2);
%
	L = 4; D = 2;
	if isempty(ECoeff)
	     ECoeff  = FastAllSeg(Bumps,L,D,R2);
	end
%
	m = max(max(abs(ECoeff)));
%
	sz = size(ECoeff);
	nl = sz(2)./3; 
	w = zeros(1,sz(2));
	[n,J] = dyadlength(Bumps);
	for i=1:nl,
	   w(1+3*(i-1)) =  -J + i;
	   w(2+3*(i-1)) =  -J + i + .2;
	   w(3+3*(i-1)) =  -J + i + .4;
	end
%
	offset = ones(sz(1),1) * w;
	x      = (1:sz(1)) ./sz(1);
	%clf; 
    %subplot(111);
	LockAxes([0 1 -J -L+1]);
	plot(x,((1/m) .* ECoeff)+offset);
	title('6.2 Multi-Resolution Filter Bank nu_{j,l}(t)')
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
