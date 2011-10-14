% toufig06 -- Tour Figure 06: WaveShrink of object yBlocks in Haar Basis
%
% (Panel a) depicts the noisy object yBlocks, its Haar transform (Panel c),
% wavelet shrinkage reconstruction using the Haar wavelet (Panel b), and 
% the Haar Transform of the reconstruction (Panel d).
%
% The viewer is supposed to notice that in the Haar domain, the
% noise is spread out among all coefficients, while the signal is
% concentrated in only a few coefficients. Hence thresholding mostly
% affects the noise without disturbing the signal.
%
global Blocks t
%
	HL = 3; 
	HQMF       = MakeONFilter('Haar');
	[x,y]      = NoiseMaker(Blocks,7);
	[xhat,xw]  = WaveShrink(y,'Visu',HL,HQMF);
	yw         = FWT_PO(y,HL,HQMF);
%
% 	clf; 
    scal = .05;
	versaplot(221,t,y,   [],' 6 (a) Noisy Data y',            [0 1 (-20) (20)],[]);
	versaplot(222,t,xhat,[],' 6 (b) VisuShrink Reconstruction',[0 1 (-20) (20)],[]);
	subplot(223);
	PlotWaveCoeff(yw,HL,scal); title(' 6 (c) Haar[y]')
	subplot(224);
	PlotWaveCoeff(xw,HL,scal); title(' 6 (d) Haar[Reconstruction]')
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
