% cspinf21 -- Thresholding Translation-Invariant Table of Blocks
%
% Here we display Stationary Wavelet Transform.  
% Object Noisy[Blocks]
% S8 Wavelet 
% Thresholded
%  Remark: run CycleSpinInit and cspinf20 before this.
%
%  Agenda:  %
%
global N
global Noisy_Stat_Table
global yblocks     %AM 10/05
%
HaarQMF = MakeONFilter('Haar');   %AM 10/05
L = 5;                            %AM 10/05
NoisyTI  = FWT_TI(yblocks,  L,HaarQMF); %AM 10/05
Noisy_Stat_Table = TI2Stat(NoisyTI);    %AM 10/05

%
	thr = sqrt(2* log(N));
%
		%figure;
		[nrow,ncol] = size(Noisy_Stat_Table);
		thrwtblocks  = Noisy_Stat_Table;
		thrwtblocks(:,2:ncol) = SoftThresh(thrwtblocks(:,2:ncol),thr);
		PlotStatTable(thrwtblocks)
		title('21. Thresholding of Stat Table of Noisy Blocks')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
