% cspinf20 -- Unscrambling TI Table 
%
% Here we display  unscrambled translation-invariant Wavelet Transform.  
% Unscrambling makes it a Continuous Wavelet Transform
% Object Noisy[Blocks]
% S8 Wavelet 
%
%  Remark: run CycleSpinInit and cspinf1[89] before this.
%
%  Agenda:  %
%
global Noisy_Stat_Table
global yblocks
%	MRD 3-9-99
%
		HaarQMF = MakeONFilter('Haar');
%
		L = 5;
		NoisyTI  = FWT_TI(yblocks,  L,HaarQMF);
% 		figure;
		Noisy_Stat_Table = TI2Stat(NoisyTI);
		PlotStatTable(Noisy_Stat_Table)
		title('20. Stat Table of Noisy Blocks')
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
