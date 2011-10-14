% toon0332 -- Behavior of Wavelet Transform of Singularities
%
%	Show the wavelet transforms of the signals in toon0331.
% 
%             Away from the singularities, 
%               the wavelet coefficients decay rapidly
%
	qmf = MakeONFilter('Coiflet',3);
	wcRamp   = FWT_PO(Ramp,3,qmf);
	wcCrease = FWT_PO(Crease,3,qmf);
	wcCusp   = FWT_PO(Cusp,3,qmf);
	wcSing   = FWT_PO(Sing,3,qmf);
%
	subplot(221); PlotWaveCoeff(wcSing,3,0.);  title('WT Sing')
	subplot(222); PlotWaveCoeff(wcRamp,3,2.);   title('WT Ramp')
	subplot(223); PlotWaveCoeff(wcCusp,3,2.);  title('WT Cusp')
	subplot(224); PlotWaveCoeff(wcCrease,3,2.); title('WT Crease')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
