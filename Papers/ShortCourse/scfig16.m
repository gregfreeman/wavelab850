% scfig16 -- Short Course 16: Noisy Differentiation by WVD in Wavelet Domain
%
% Here the procedure of Figure 16 is displayed in the Wavelet domain.
%
% The noise in the naive inversion grows rapidly in size 
% as we move to finer resolutions.
%
global Bumps                            %AM 10/05
global w wb ws
%
zBumps = cumsum(Bumps);                 %AM 10/05
x = zBumps + WhiteNoise(zBumps);        %AM 10/05
z = diff([0 x]);                        %AM 10/05
QMF_Filter= MakeONFilter('Coiflet',3);  %AM 10/05
w         = FWT_PO(z, 5,QMF_Filter);    %AM 10/05
ws        = InvShrink(w,5,4,1);         %AM 10/05
wb = FWT_PO(Bumps,5,QMF_Filter);        %AM 10/05

% 	clf;
	subplot(221); PlotWaveCoeff(wb,5,0.); title('16 (a) WT[ Object ]')
	subplot(222); PlotWaveCoeff(w,5,0.); title('16 (b) WT[ Naive Recon. ]')
	subplot(223); PlotWaveCoeff(ws,5,0.); title('16 (c) WT[ WVD Reconstruction ]')
    
%Revision History
% 10/1/05     AM     Changing the name of some variables and recalculating
%                    some of the global variables

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
