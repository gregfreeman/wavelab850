function PlotMultiRes(wc,L,scal,qmf)
% PlotMultiRes -- Multi-Resolution Display of 1-d Wavelet Transform
%  Usage
%    PlotMultiRes(wc,L,scal,qmf)
%  Inputs
%    wc    1-d wavelet transform
%    L     level of coarsest scale
%    scal  scale factor [0 ==> autoscale]
%    qmf   quadrature mirror filter used to make wc
%
%  Side Effects
%    A depiction of the multi-resolution decomposition
%    of the signal, as in S. Mallat.
%
%  See Also
%    PlotWaveCoeff, FWT_PO, IWT_PO, MakeONFilter
%
    wavecoef = ShapeAsRow(wc);
	if scal==0, 
		scal = 1. / max(abs(wavecoef)); 
	end
	[n,J] = dyadlength(wavecoef); 
%
	LockAxes([0 1 -(J) (-L+2)]);
	t = (.5:(n-.5))/n;
	for j=(J-1):-1:L
	   w = zeros(1,n);
	   w(dyad(j)) = wavecoef(dyad(j));
	   x = IWT_PO(w,j,qmf);
	   plot(t, -(j) + scal.*x);
	end
%
	w = zeros(1,n);
	w(1:2^(L)) = wavecoef(1:2^(L));
	x = IWT_PO(w,L,qmf);
	plot(t,(-(L-1)) + scal.*x);
%
	xlabel('t'); ylabel('Dyad');
	title('Multi-Resolution Decomposition');
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
