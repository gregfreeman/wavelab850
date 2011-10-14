function live_thresh
% live_thresh -- Called by WLBrowser
%  Usage
%    live_thresh
%  Inputs
%    none
%  Outputs
%    none
%
%  Description
%    This routine carries out various actions initiated
%    by the user of WLBrowser.  The action to be carried
%    out is specified by the global variable action.
%

if     strcmp(action,'vertslider'),
    f = get(h_vertslider,'value');
	thr = exp(f);
	i = max(find(wcsort > thr));
	i = max([min([n i]) 1]);
	frac = (i-1) / n;
elseif strcmp(action,'horizslider'),
    frac = get(h_horizslider,'value');
	i = floor(1 + frac * n); 
	thr = wcsort(i);
	f   = log(thr);
elseif strcmp(action,'halfnumber')
    frac = get(h_horizslider,'value') / 2;
	i = floor(1 + frac * n); 
	thr = wcsort(i); 
	f = log(thr);
elseif strcmp(action,'doublenumber')
    frac = get(h_horizslider,'value') * 2;
	frac = min([frac 1]);
	i = floor(min([(1 + frac * n) n])); 
	thr = wcsort(i); 
	f = log(thr);
elseif strcmp(action,'halfthresh')
    f = get(h_vertslider,'value');
	thr = exp(f)/2; 
	f = log(thr);
	i = max(find(wcsort > thr));
	i = max([min([n i]) 1]);
	frac = (i-1) / n;
elseif strcmp(action,'doublethresh')
    f = get(h_vertslider,'value');
	thr = exp(f)*2;
	i = max(find(wcsort > thr));
	i = max([min([n i]) 1]);
	frac = (i-1) / n;
end
set(h_horizslider,'value',frac);
set(h_vertslider,'value',f);

m=3;st='Sorted Wavelet Coefficients';setfigure;
% figure(fig_hand3);

semilogy(wcsort); hold on;
semilogy([i i],[wcsort(n) wcsort(1)],'r');
semilogy([1 n],[wcsort(i) wcsort(i)],'r');
hold off;
title(sprintf('Sorted Wavelet Coefficients; %s',signal_name));

wct = HardThresh(wc,thr);

m=2;st='Coefficients above Threshold';setfigure;
% figure(fig_hand2);
subplot(212)
PlotWaveCoeff(wct,Coarse,0.);
title(sprintf('Coefficients above Threshold %g',thr))

m=1;st='Reconstruction';setfigure;
% figure(fig_hand1);

subplot(212)
recon = IWT_PO(wct,Coarse,QMF_Filter);
plot(recon);
title(sprintf('Reconstruction from N=%g Coefficients',i))
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
