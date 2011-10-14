% scfig15 -- Short Course 15: Noisy Differentiation by WVD
%
% Here we illustrate the use of wavelets for noisy differentiation.
% (Panel a) displays object Bumps, (panel b) its noisy cumulative, 
% and (Panel c) a naive inversion based on differencing. 
%
% The naive inversion is very noisy and displays only a hint of the 
% structure of the underlying function.
%
% We also display a wavelet-shrinkage reconstruction, in which noise is
% suppressed while the structure remains. 
%
% The wavelet-shrinkage reconstruction goes as follows
%
%       1.  Transform the naive reconstruction into the wavelet domain.
%       2.  Apply level-dependent thresholds which scale inversely with 
%           resolution.
%       3.  Return to the wavelet domain.
%
%  Coiflets with 3 vanishing moments are used.
%
global Bumps
global w wb ws
%
%   1. Generate signal(Bumps), Noisy Cumulative (x), Naive Inversion(y)
%
	zBumps = cumsum(Bumps);
	N = length(Bumps);
	t = (0:(N-1))/N;
	x = zBumps + WhiteNoise(zBumps);
	z = diff([0 x]);
%
%   2. Apply resolution-dependent thresholding
%
	QMF_Filter= MakeONFilter('Coiflet',3);
	w         = FWT_PO(z, 5,QMF_Filter);
	ws        = InvShrink(w,5,4,1);
	zrec      = IWT_PO(ws,5,QMF_Filter);
%
%   3. Displays
%
	wb = FWT_PO(Bumps,5,QMF_Filter);
%
% 	clf;
	subplot(221); plot(t,Bumps); title('15 (a) Object Bumps')
	subplot(222); plot(t,x);     title('15 (b) Noisy Cumulative')
	subplot(223); plot(t,z);     title('15 (c) Naive Reconstruction by Differencing')
	subplot(224); plot(t,zrec);  title('15 (d) WVD Reconstruction')
    
% Revision History
%  10/1/05          AM            Name of the variable QMF is changed to
%                                 QMF_Filter

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
