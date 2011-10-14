% cspinf19 -- Unscrambling TI Table to Stat Table
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
global tiwtblocks
global yblocks    %AM 10/05
%
    QMF_Filter = MakeONFilter('Symmlet',8);  %AM 10/05
	L = 5;                                   %AM 10/05
    [tiwtblocks]  = FWT_TI(yblocks,  L,QMF_Filter); %AM 10/05
%
% 		figure;
		Stat_Table = TI2Stat(tiwtblocks);
		PlotStatTable(Stat_Table)
		title('19. Stat Table (=Unscrambled TI Table) of Blocks')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
