function PlotPBSMultiRes(wc,L,scal,qmf,dqmf)
% PlotPBSMultiRes -- Multi-Resolution Display of 1-d Wavelet Transform
%  Usage
%    PlotPBSMultiRes(wc,L,scal,qmf,dqmf)
%  Inputs
%    wc     1-d wavelet transform
%    L      level of coarsest scale
%    scal   scale factor [0 ==> autoscale]
%    qmf    quadrature mirror filter used to make wc
%    qqmf   dual quadrature mirror filter used to make wc
%
%  Side Effects
%    A depiction of the multi-resolution decomposition
%    of signal, as in S. Mallat.
%
%  See Also
%    PlotWaveCoeff, FWT_PBS, IWT_PBS, MakeBSFilter
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
	   x = IWT_PBS(w,j,qmf,dqmf);
	   plot(t, -(j) + scal.*x);
	end
%
	w = zeros(1,n);
	w(1:2^(L)) = wavecoef(1:2^(L));
	x = IWT_PBS(w,L,qmf,dqmf);
	plot(t,(-(L-1)) + scal.*x);
%
	xlabel('t'); ylabel('Dyad');
	title('Multi-Resolution Decomposition');
	UnlockAxes;

%
% Copyright (c) 1995. David L. Donoho
%     
    
        
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
