function [xh,wcoef] = WaveJS(y,L,qmf)% WaveJS -- James-Stein Shrinkage Applied to  Wavelet dyads%  Usage%    [xh,xwh] = WaveJS(y,L,qmf)%  Inputs%    y      array of dyadic length 2^J%           NORMALIZED TO NOISE LEVEL 1 (See NOISENORM)%    L      Low-Frequency cutoff for shrinkage (e.g. L=4)%           SHOULD BE L << J%    qmf    Quadrature Mirror Filters for Wavelet Transform%  Outputs%    xh   estimate, obtained by James-Stein Shrinkage%         on Wavelet Coefficients%    xwh  Wavelet Transform of estimate%  See Also%    FWT_PO, IWT_PO, JamesStein%	[n,J] = dyadlength(y); 	wcoef = FWT_PO(y,L,qmf) ;	for j=(J-1):-1:L	   wcoef(dyad(j)) = JamesStein(wcoef(dyad(j))) ;	end	xh = IWT_PO(wcoef,L,qmf);                
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
