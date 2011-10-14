% adfig05 -- Adapt Figure 05: A Display of all four wavelets, j=6, k=32;%% The display shows four mother wavelets from the Haar,% original Daubechies, Coiflet, and Nearly Symmetric Families.%	xw = zeros(1,2048);	xw(dyad2ix(6,32)) = 1;	HaarQMF = MakeONFilter('Haar');	HaarWave = IWT_PO(xw,5,HaarQMF);	%HaarWave = MakeWavelet(6,32,'Haar',1,'Mother',2048);	D4QMF   = MakeONFilter('Daubechies',4);	DaubWave = IWT_PO(xw,5,D4QMF);	%DaubWave = MakeWavelet(6,32,'Daubechies',4,'Mother',2048);	C3QMF   = MakeONFilter('Coiflet',3);	CoifWave = IWT_PO(xw,5,C3QMF);	%CoifWave = MakeWavelet(6,32,'Coiflet',3,'Mother',2048);	S8QMF   = MakeONFilter('Symmlet',8);	SymmWave = IWT_PO(xw,5,S8QMF);	%SymmWave = MakeWavelet(6,32,'Symmlet',8,'Mother',2048);%%  2 * 2 array of plots%	%clf;	tt = (.5:2047.5)/2048;	versaplot(221,tt,HaarWave,[],'5 (a) Haar Wavelet',         [.4 .6 -.3 +.3],[])	versaplot(222,tt,DaubWave,[],'5 (b) Daubechies D4 Wavelet',[.4 .6 -.3 +.3],[])	versaplot(223,tt,CoifWave,[],'5 (c) Daubechies C3 Coiflet',[.4 .6 -.3 +.3],[])	versaplot(224,tt,SymmWave,[],'5 (d) Daubechies S8 Symmlet',[.4 .6 -.3 +.3],[])         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
