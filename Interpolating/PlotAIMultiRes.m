function PlotAIMultiRes(wc,L,scal,D)
% PlotAIMultiRes -- Average-Interpolating MRA
%  Usage
%    PlotAIMultiRes(wc,L,scal,D)
%  Inputs
%    wc    1-d wavelet transform
%    L     level of coarsest scale
%    scal  scale factor [0 ==> autoscale]
%    D     Degree of AI filter used to make wc
%
%  Side Effects
%    A depiction of the multi-resolution decomposition
%    of the signal, as in S. Mallat.
%
%  See Also
%    PlotWaveCoeff, FWT_AI, IWT_AI, MakeAIFilter
%
	if nargin < 4,
	   D = 2;
	end
	if nargin < 3,
	   scal = 0.;
	end
%
	wavecoef = ShapeAsRow(wc);
	[n,J] = dyadlength(wavecoef); 
	F = MakeAIFilter(D);
	EF = MakeAIBdryFilter(D);
%
	w = zeros(1,n);
	w(1:2^(L)) = wavecoef(1:2^(L));
	x = IWT_AI(w,L,D,F,EF);
	s = 1 ./ max(max(abs(x)));
	if scal==0, 
		scal = s; 
	end
%
	LockAxes([0 1 -(J) (-L+3)]);
	t = (.5:(n-.5))/n;
	plot(t,(-(L-1)) + scal.*x);
%
	for j=(J-1):-1:L
	   w = zeros(1,n);
	   w(dyad(j)) = wavecoef(dyad(j));
	   x = IWT_AI(w,j,D,F,EF);
	   plot(t, -(j) + scal.*x);
	end
%
%
	xlabel('t'); ylabel('Dyad');
	title('AI Multi-Resolution Decomposition');
%
	UnlockAxes;

%
% Copyright (c) 1993. David L. Donoho
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
