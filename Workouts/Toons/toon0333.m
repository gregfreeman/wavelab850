% toon0333 -- Behavior of Wavelet Transform of Singularities
% 
%	Show the MRA's of the signals in toon0331.
%
	qmf = MakeONFilter('Coiflet',3);
	wcRamp   = FWT_PO(Ramp,3,qmf);
	wcCrease = FWT_PO(Crease,3,qmf);
	wcCusp   = FWT_PO(Cusp,3,qmf);
	wcSing   = FWT_PO(Sing,3,qmf);
%
	subplot(221); PlotMultiRes(wcRamp  ,3,2.,qmf);  title('MR Ramp')
	subplot(222); PlotMultiRes(wcCrease,3,2.,qmf);  title('MR Crease')
	subplot(223); PlotMultiRes(wcCusp  ,3,2.,qmf);  title('MR Cusp')
	subplot(224); PlotMultiRes(wcSing  ,3,0.,qmf);  title('MR Sing')
    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
