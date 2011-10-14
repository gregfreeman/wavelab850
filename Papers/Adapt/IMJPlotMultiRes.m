function IMJPlotMultiRes(wavecoef,L,scal,QMF_Filter)% IMJPlotMultiRes -- Mallat-Style MRA plot -- IJ version with changed axis labelling%if scal==0,     scal = 1. / max(abs(wavecoef)); end[n,J] = dyadlength(wavecoef); LockAxes([0 1 (L-2) J]);t = (.5:(n-.5))/n;%	for j=(J-1):-1:L	   w = zeros(1,n);	   w(dyad(j)) = wavecoef(dyad(j));	   x = IWT_PO(w,j,QMF_Filter);	   plot(t, j + scal.*x);	end	w = zeros(1,n);	w(1:2^(L)) = wavecoef(1:2^(L));	x = IWT_PO(w,L,QMF_Filter);	plot(t,(L-1) + scal.*x);%xlabel('Spatial Var.'); ylabel('Dyadic Resolution Level');%title('Multi-Resolution Decomposition');UnlockAxes;% Revision History%  10/1/05          AM            Name of the variable QMF is changed to%                                 QMF_Filter     
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
