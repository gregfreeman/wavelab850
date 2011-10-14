function sing = SharpPart(wc,sg,L,D,F2,E2,segpt)
% SharpPart -- Singularity Surfer
%  Usage
%    sing = SharpPart(wc,sg,L,D,F2,E2,segpt)
%
	[n,J] = dyadlength(wc);
	k = floor(n*segpt);
	segpt
%
% fix up fine scale coefft's
%
	% subplot(311); PlotWaveCoeff(wc,L,0.)
	recon = IWT_AI(wc,L,D,F2,E2);
	wcn   = FWT_SegAI(recon,L,D,F2,E2,segpt);
	wcs =  zeros(size(wc));
	for lev=(J-1):-1:L,
		   k0 = floor(n/(2^(J-lev)) * segpt);
		   wcs(2^(lev)+k0-(2:1)) = wcn(2^(lev)+k0-(2:1));
		   wcs(2^(lev)+k0)  = wcn(2^(lev)+k0);
		   wcs(2^(lev)+k0+1)= wcn(2^(lev)+k0+1);
		   wcs(2^(lev)+k0+2)= wcn(2^(lev)+k0+2);
		   wcs(2^(lev)+k0+(3:4)) = wcn(2^(lev)+k0+(3:4));
	end
	% subplot(313); PlotWaveCoeff(wcs,L,0.)
	% subplot(312); PlotWaveCoeff(wcn,L,0.)
%
% fix up coarse scale coefft's
%
	k0 = floor(2^L * segpt);
	wcs(k0-1:k0+2) =  wcn(k0-1:k0+2);
	sing = IWT_SegAI(wcs,L,D,F2,E2,segpt);
    
 
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
