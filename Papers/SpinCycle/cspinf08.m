% cspinf08 -- Closeups of Fully TI Haar Wavelet Shrinkage
%
% Here we test fully translation-invariant denoising, using
% the Stationary Wavelet Transform.  This is a method of removing artifacts
% from wavelet thresholding and other de-noising.
% Using this in a clever way, we can average 
% the results of de-noising on
% *all* circulant shifts of a signal.
%
% The procedure for DeNoising:
%       1.  Translation-Invariant Transform to Wavelet Domain, 
%			Using Haar Wavelet.
%       2.  Apply a Soft thresholding nonlinearity, with threshold set to
%           sqrt{2 log(n)}
%       3.  Transform back to the signal domain.
% 
%  We do this on *all* circulant shifts of a signal and
%  then average the results.
%  
%
%  Remark: run CycleSpinInit and cspinf0[12] before this.
%  Remark: run cspinf07 before this
%  Agenda:  %
global yblocks ybumps yheavi yDoppler
global t
global xhblocks xblocks zblocks
%
global xhheavi
%
if isempty(zblocks)
    warndlg('Please run figure 6 first and then run this figure');
    return;
end

% 	figure;
	ax = [.0 .35 -15 25];
	subplot(2,2,1); plot(t,xhblocks,'-'); axis(ax); hold on; plot(t,xblocks,'.')
	title(' 8a TI Haar DeNoising & Blocks')
%
	subplot(2,2,2);
	plot(t,zblocks); axis(ax);
	title(' 8b Ordinary Haar DeNoising');

%	Revision History
%		09/29/99	MRD	declare xblocks etc. global
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
