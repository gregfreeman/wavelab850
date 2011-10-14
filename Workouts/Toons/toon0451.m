% toon0451 -- Unconditional Basis Property
%
%       Consider the Signal ---
%
%             Ramp = t - (t >= .37);
%
%     What do we get if we ``shrink'' the coefficients in its
%           wavelet expansions?
%     Here we will randomly shrink each coefficient to an amount
%           between 60% and 100% of its former size, and reconstruct.
%     We will compare this with the same operation in the Cosine
%           Transform domain
%
    qmf = MakeONFilter('Coiflet',3);
%
	n        = 1024; t =(1:n)./n;
	Ramp     = MakeSignal('Ramp',n);
	wcRamp   = FWT_PO(Ramp,3,qmf);
	dcRamp   = dct_iv(Ramp);
	haRamp   = FWT_PO(Ramp,1,MakeONFilter('Haar'));
%
    swDWT   = wcRamp  .*   (.6 + .4 .* rand(size(wcRamp)));
    swDCT 	= dcRamp  .*   (.6 + .4 .* rand(size(wcRamp)));
    swDHT   = haRamp  .*   (.6 + .4 .* rand(size(wcRamp)));
%
	PertWT   = IWT_PO(swDWT,3,qmf);
	PertHT   = IWT_PO(swDHT,1,MakeONFilter('Haar'));
	PertDCT		= dct_iv(swDCT);
%
    subplot(2,2,1); plot(t, Ramp); title('Ramp');
	ax = [0 1 -.6 .4]; axis(ax);
%
    subplot(2,2,2); plot(t, PertWT); title('Shrunk in S8 Wavelet Domain') ; axis(ax)
    subplot(2,2,3); plot(t, PertHT); title('Shrunk in Haar Domain') ; axis(ax);
    subplot(2,2,4); plot(t, PertDCT); title('Shrunk in Cosine Domain'); axis(ax) 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
