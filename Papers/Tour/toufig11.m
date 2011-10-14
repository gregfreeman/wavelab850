% toufig11 -- Tour Figure 11: Noisy Differentiation in Wavelet Domain
%
% Here the procedure of Figure 16 is displayed in the Wavelet domain.
%
% The noise in the naive inversion grows rapidly in size 
% as we move to finer resolutions.
%
global w wb ws
%
% 	clf;
	subplot(221); PlotWaveCoeff(wb,5,0.); title('11 (a) WT[Object]')
	subplot(222); PlotWaveCoeff(w,5,0.); title('11 (b) WT[ Naive Reconstruction ]')
	subplot(223); PlotWaveCoeff(ws,5,0.); title('11 (c) WT[ WVD Reconstruction ]')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
