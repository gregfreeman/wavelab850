% toon0335 -- Behavior of Wavelet Transform of Singularities
%
%		Show the ordered wavelet coefficients for the signals in toon0331.
%
	qmf = MakeONFilter('Symmlet',8);
	wcRamp   = FWT_PO(Ramp,3,qmf);
	wcCrease = FWT_PO(Crease,3,qmf);
	wcCusp   = FWT_PO(Cusp,3,qmf);
	wcSing   = FWT_PO(Sing,3,qmf);
%
	ax = [0 100 10^(-2) 10];
%
	subplot(221); PlotOrderedCoef(wcSing  );  title('OrderedCoef Sing')  ; axis(ax)
	subplot(222); PlotOrderedCoef(wcRamp  );  title('OrderedCoef Ramp')  ; axis(ax)
	subplot(223); PlotOrderedCoef(wcCusp  );  title('OrderedCoef Cusp')  ; axis(ax)
	subplot(224); PlotOrderedCoef(wcCrease);  title('OrderedCoef Crease'); axis(ax)
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
