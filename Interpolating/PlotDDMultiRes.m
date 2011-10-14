function PlotDDMultiRes(wc,L,scal,D)
% PlotDDMultiRes -- Interpolating MRA
%  Usage
%    PlotDDMultiRes(wc,L,scal,D)
%  Inputs
%    wc    1-d wavelet transform
%    L     level of coarsest scale
%    scal  scale factor [0 ==> autoscale]
%    D     Degree of DD filter used to make wc
%
%  Side Effects
%    A depiction of the multi-resolution decomposition
%    of the signal, as in S. Mallat.
%
%  See Also
%    PlotWaveCoeff, FWT_DD, IWT_DD, MakeDDFilter
%
	
	if nargin < 4,
	   scal = 0.;
	end
	if nargin < 3,
	   D =3;
	end
%
	wavecoef = ShapeAsRow(wc);
	[n,J] = dyadlength(wavecoef); 
	if scal==0, 
		scal = 1. / max(abs(wavecoef)); 
	end
	F = MakeDDFilter(D);
	[LEF,REF] = MakeDDBdryFilter(D);
%
	LockAxes([0 1 -(J) (-L+2)]);
	t = (.5:(n-.5))/n;
%
	for j=(J-1):-1:L
	   w = zeros(1,n);
	   w(dyad(j)) = wavecoef(dyad(j));
	   x = IWT_DD(w,j,D,F,LEF,REF);
	   plot(t, -(j) + scal.*x);
	end
%
	w = zeros(1,n);
	w(1:2^(L)) = wavecoef(1:2^(L));
	x = IWT_DD(w,L,D,F,LEF,REF);
%
	plot(t,(-(L-1)) + scal.*x);
	xlabel('t'); ylabel('Dyad');
	title('DD Multi-Resolution Decomposition');
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
