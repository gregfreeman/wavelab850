% toufig14 -- Tour Figure 14: Depict Deconvolution in Wavelet Domain
%
% The Figure depicts the wavelet deconvolution of Figure 2 in the 
% wavelet domain.
%
% Again, the noise is very large at high resolution. The resolution-
% dependent thresholds increase with the reciprocal of resolution 
% in an appropriate way,
%
global Bumps                               %AM 10/05
global w wb ws
% clf;
%
	zBumps = cumsum(Bumps);                 %AM 10/05
    x = zBumps + WhiteNoise(zBumps);        %AM 10/05
	z = diff([0 x]);                        %AM 10/05
    QMF_Filter = MakeONFilter('Coiflet',3); %AM 10/05
	w    = FWT_PO(z, 5,QMF_Filter);         %AM 10/05
	ws   = InvShrink(w,5,4,1);              %AM 10/05
	wb = FWT_PO(Bumps,5,QMF_Filter);        %AM 10/05
%
	subplot(221); 
	WaveCoeffLim(wb,0.,5,-.5,1.5); title('14 (a) WT[Object]')
%
	subplot(222); 
	WaveCoeffLim(w ,0.,5,-.5,1.5); title('14 (b) WT[Naive Reconstruction]')
%
	subplot(223); 
	WaveCoeffLim(ws,0.,5,-.5,1.5); title('14 (c) WT[ WVD Reconstruction ]')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
