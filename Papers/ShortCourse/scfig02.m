% scfig02 -- Short Course 02: Noisy Deconvolution
%
% In this example, the object ``Bumps'' is convolved with a recursive
% filter that blurs out the sharp structure; and then noise is added.
% (panels a,b)
%
% The deconvolution problem is ill-posed, in that when we apply the
% inverse filter, we get an object which is extremely noisy and has
% no real resemblance to the original object. (panel c)
%
% When we apply thresholding in the wavelet domain, with thresholds
% specially chosen to adapt to the structure of the deconvolution
% problem, we get a reconstruction which is nearly noise free and which
% also preserves the structure of the Bumps object. (panel d)
%
global Bumps
global wcNaive wcObject wcDeNoised
global t
global alf
%
	N2 = length(Bumps)/2;
	x = [ zeros(1,N2) Bumps zeros(1,N2)];
	sx = filter(1,[1 ((-2 * alf)) (alf^2)],x);
	nsx = sx + WhiteNoise(sx);
	dnsx = filter([1 ((-2 * alf)) (alf^2)],1,nsx);
%
	QMF_Filter  = MakeONFilter('Coiflet',2);
	wcNaive      = FWT_PO(dnsx, 5, QMF_Filter);
	wcDeNoised   = MultiMAD(wcNaive,5);
	recx         = IWT_PO(wcDeNoised,5,QMF_Filter);
%
	wcObject     = FWT_PO(x,5,QMF_Filter);
%
% 	clf;
	ts = [ linspace(-.5,(-1) ./ (2*N2), N2) t linspace(1 + 1 ./ (2*N2), 1.5, N2)];
	subplot(221); plot(ts,x);    title('2 (a) Object')
	subplot(222); plot(ts,nsx);  title('2 (b) Noisy Blurred')
	subplot(223); plot(ts,dnsx); title('2 (c) Naive DeBlurred')
	subplot(224); plot(ts,recx); title('2 (d) WVD Reconstruction')

% Revision History
%  10/1/05          AM            Name of the variable QMF is changed to
%                                 QMF_Filter


    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
