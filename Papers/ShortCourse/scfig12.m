% scfig12 -- Short Course 12: DeNoising a 2-d object
%
% Here we display the image of Ingrid Daubechies, a noisy version of same
% and noisy and de-noised closeups.
%
% The de-noising was accomplished by
%
%    1. Transforming to the wavelet domain (Coiflets with 3 vanishing moments)
%    2. Applying a threshold at 2 standard deviations
%    3. Returning to the signal domain.
%
	Ingrid = ReadImage('Daubechies');
	NoisyIngrid = Ingrid + 5*WhiteNoise(Ingrid);
%
	CoifQMF = MakeONFilter('Coiflet',3);
	wc_Noisy = FWT2_PO(NoisyIngrid,3,CoifQMF);
	Coarse  = wc_Noisy(1:8,1:8);
	thr     = 10;
	Thr_wc_Noisy = SoftThresh(wc_Noisy,thr);
	Thr_wc_Noisy(1:8,1:8) = Coarse;
	CleanIngrid = IWT2_PO(Thr_wc_Noisy,3,CoifQMF);
%
	subplot(221); GrayImage(Ingrid);
	title('Ingrid Daubechies');
%
	subplot(222); GrayImage(Ingrid); axis([110 160 110 160]);
	title('Closeup');
%
	subplot(223); GrayImage(NoisyIngrid); axis([110 160 110 160]);
	title('Noisy (closeup)');
%
	subplot(224); GrayImage(CleanIngrid); axis([110 160 110 160]);
	title('De-Noised (closeup)');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
