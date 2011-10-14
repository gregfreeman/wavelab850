function live_wpcompress(action)
% live_wpcompress -- Called by WLBrowser
%  Usage
%    live_wpcompress(action)
%
%  Description
%    Callback to interactively update wpcompress.
%
	global h_vertslider h_horizslider 
	global h_vertlin    h_horizline signal_name
	global wc wcsort n fig_hand3 fig_hand2 fig_hand1 Coarse QMF_Filter
	global wp bb nlevel

	% update controls
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

	% update Auxiliary window

	set(h_horizslider,'value',frac);
	set(h_vertslider,'value',f);
	figure(fig_hand3);
	semilogy(wcsort); hold on;
	semilogy([i i],[wcsort(n) wcsort(1)],'r');
	semilogy([1 n],[wcsort(i) wcsort(i)],'r');
	hold off;
	title(sprintf('Sorted WP Coefficients; %s',signal_name));

	% update Transform Window	

	wct = HardThresh(wc,thr);
	figure(fig_hand2);
	subplot(212)
	plot(wct);
	title(sprintf('Coefficients above Threshold %g',thr))

	% update Reconstruction window	

	figure(fig_hand1);
	subplot(212)
	wpt   = PackBasisCoeff(bb,wp,wct);
	recon = WPSynthesis(bb,wpt,QMF_Filter);
	plot(recon);
	title(sprintf('Reconstruction from N=%g Coefficients',i))
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
