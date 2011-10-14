function do_wpcompress
% do_cpcompress -- Called by WLBrowser
%  Usage
%    do_wpcompress
%
%  Description 
%    Uses Transform Window for plots of cp Coeffs before/after thresholding.
%    Uses Reconstruction Window for Plots of object before/after thresholding.
%    Uses Auxiliary Window for Plot of sorted cpC's with sliders to pick
%    number of coefficients to keep, etc.
% 
	global cp bb wc wcsort nlevel
	global h_horizslider QMF_Filter Coarse
	global h_vertslider
	do_global;

	% plot cp of object in Transform window

	if n >= 1024,
	    nlevel = 7;
	else
	    nlevel = 5;
	end
	
	cp   = CPAnalysis(x_use,nlevel,'Sine');	
	stat = CalcStatTree(cp,ent_type,ent_par);
	bb   = BestBasis(cp,nlevel);
	wc   = UnpackBasisCoeff(bb,cp);
		
	figure(fig_hand2);
	clf;
	subplot(211);

	plot(wc);
	title(sprintf('CP BestBasis Coefficients; %s',signal_name));

	% plot object in Reconstruction window	

	figure(fig_hand1);
	clf;
	subplot(211);

	plot(x_use);
	title(sprintf('Original %s',signal_name));


	% calculate sorted wavelet coefficients
	wcsort = reverse(sort(abs(wc(:))));
	i = floor(1 + .05 * (n-1)) ;
	thr = wcsort(i);

	% set up auxiliary window
	%   slider and pushbutton controls
	
	figure(fig_hand3); clf;
	axes('position',[0.25,0.25,0.65,.65]);
	set(fig_hand3, 'Name', 'Sorted coefficients' );
	%set(fig_hand3,'UserData',[thr i wcsort]);
	h_horizslider = uicontrol('style','slider','units','normal','pos',[.25,.075,.65,.075],...     
		  'min',0,'max',1,'value',.05,...
		 'call','live_cpcompress(''horizslider'');');
	h_vertslider = uicontrol('style','slider','units','normal','pos' ,[.10,.30,.05,.65],...     
		  'min',log(wcsort(1))-10,'max',log(wcsort(1)),'value',log(thr),...
		 'call','live_cpcompress(''vertslider'');');
	uicontrol('style','pushbutton','units','normal','string','number*2 ',...
		 'pos',[0.02,0.01,0.15, 0.06],...
		 'call','live_cpcompress(''doublenumber'');');
	uicontrol('style','pushbutton','units','normal','string','number/2 ',...
		 'pos',[0.02,0.07,0.15, 0.06],...
		 'call','live_cpcompress(''halfnumber'');');
	uicontrol('style','pushbutton','units','normal','string','thresh*2',...
		 'pos',[0.02,0.13,0.15, 0.06],...
		 'call','live_cpcompress(''doublethresh'');');
	uicontrol('style','pushbutton','units','normal','string','thresh/2',...
		 'pos',[0.02,0.19,0.15, 0.06],...
		 'call','live_cpcompress(''halfthresh'');');

	%  plot sorted wavelet coefficients, with crosshairs
	%  indicating threshold height and threshold number

	figure(fig_hand3);
	semilogy(wcsort); hold on;
	semilogy([i i],[wcsort(n) wcsort(1)],'r');
	semilogy([1 n],[wcsort(i) wcsort(i)],'r');
	hold off;
	title(sprintf('Sorted CP Coefficients; %s',signal_name));

	%  plot thresholded wavelet transform in panel 2 of transform window	
	wct = HardThresh(wc,thr);
	figure(fig_hand2);
	subplot(212)
	plot(wct);
	title(sprintf('Coefficients above Threshold %g',thr))

	%  reconstructed signal in panel 2 of Reconstruction window	
	figure(fig_hand1);
	subplot(212)
	cpt   = PackBasisCoeff(bb,cp,wct);
	recon = CPSynthesis(bb,cpt,'Sine');
	plot(recon);
	title(sprintf('Reconstruction from N=%g Coefficients',i))

%  Revision History
%             10/1/05     AM     Changing the name of the variable QMF

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
