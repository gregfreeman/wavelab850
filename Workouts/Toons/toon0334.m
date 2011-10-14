% toon0334 -- Behavior of Wavelet Transform of Singularities
%
%		Show the level norms for the signals in toon0331.
%
	qmf = MakeONFilter('Symmlet',8);
	wcRamp   = FWT_PO(Ramp,3,qmf);
	wcCrease = FWT_PO(Crease,3,qmf);
	wcCusp   = FWT_PO(Cusp,3,qmf);
	wcSing   = FWT_PO(Sing,3,qmf);
%
	ax = [0 12 10^(-2) 10^4];
%
	subplot(221); PlotLevelNorms(wcSing  ,3);  title('Decay Sing')  ; axis(ax)
	subplot(222); PlotLevelNorms(wcRamp  ,3);  title('Decay Ramp')  ; axis(ax)
	subplot(223); PlotLevelNorms(wcCusp  ,3);  title('Decay Cusp')  ; axis(ax)
	subplot(224); PlotLevelNorms(wcCrease,3);  title('Decay Crease'); axis(ax)
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
