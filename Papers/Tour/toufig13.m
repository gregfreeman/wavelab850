% toufig13 -- Tour Figure 13: Noisy Deconvolution
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
global w wb ws
global t
global alf
%
	N2 = length(Bumps)/2;
	x = [ zeros(1,N2) Bumps zeros(1,N2)];
	tt = [ linspace(-.5,(-1) ./ (2*N2), N2) t linspace(1 + 1 ./ (2*N2), 1.5, N2)];
	sx = filter(1,[1 ((-2 * alf)) (alf^2)],x);
	nsx = sx + WhiteNoise(sx);
	dnsx = filter([1 ((-2 * alf)) (alf^2)],1,nsx);
%
	QMF_Filter  = MakeONFilter('Coiflet',2);
	w    = FWT_PO(dnsx, 5, QMF_Filter);
	ws   = MultiMAD(w,5);
	recx = IWT_PO(ws,5,QMF_Filter);
%
	wb   = FWT_PO(x,5,QMF_Filter);
%
% 	clf;
	subplot(221); plot(tt,x); title('13 (a) Object')
	subplot(222); plot(tt,sx); title('13 (b) Noisy Blurred')
	subplot(223); plot(tt,dnsx); title('13 (c) Naive DeBlurred')
	subplot(224); plot(tt,recx); title('13 (d) WVD Reconstruction')


%  Revision History
%             10/1/05     AM     Changing the name of the variable QMF
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
