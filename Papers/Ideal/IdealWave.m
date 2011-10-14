function [hx,hbx] = IdealWave(t,x,y,sa,L,qmf)
% IdealWave -- Estimate using Ideal Wavelet Damping
% Usage:
%     [hx,hbx] = IdealWave(t,x,y,sa,L,qmf)
% Inputs:
%     t,x     True signal x and sample points t
%     y,sa    Noisy data and Noise Level
%     L       base-frequency level
%     qmf     Mirror Filters (see e.g. DaubechiesTables)
% Outputs:
%     hx      Ideally-Wavelet-Damped estimate of x using y
%             and knowledge of x
%     hbx     Its wavelet transform
% Side Effects:
%     plot of ideal reconstruction and truth (commented out)
by = FWT_PO(y,L,qmf);
bx = FWT_PO(x,L,qmf);
wt = idealwts(bx,sa);
wt(1:(2^(L))) = ones(1,2^(L));
sum(wt).*(sa^2)./length(t)  %per coordinate risk
hbx = wt .* by;
hx = IWT_PO(hbx,L,qmf);
%clf; subplot(211)
%plot(t,x); title('Truth')
%plot(t,hx); title('Ideal Wavelet Recovery')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
