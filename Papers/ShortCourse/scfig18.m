% scfig18 -- Short Course 18: Depict Deconvolution in Wavelet Domain
%
% The Figure depicts the wavelet deconvolution of Figure 2 in the 
% wavelet domain.
%
% Again, the noise is very large at high resolution. The resolution-
% dependent thresholds increase with the reciprocal of resolution 
% in an appropriate way,
%
global wcNaive wcObject wcDeNoised
if isempty(wcNaive),   % run figure 2
     scfig02  
end
% clf;
subplot(221); 
WaveCoeffLim(wcObject  ,0.,5,-.5,1.5); title('18 (a) WT[Object]')
subplot(222); 
WaveCoeffLim(wcNaive   ,0.,5,-.5,1.5); title('18 (b) WT[Naive Reconstruction]')
subplot(223); 
WaveCoeffLim(wcDeNoised,0.,5,-.5,1.5); title('18 (c) WT[ WVD Reconstruction]')
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
