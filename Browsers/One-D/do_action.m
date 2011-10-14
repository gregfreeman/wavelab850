function do_action(action_switch)
% do_action -- Called by WLBrowser
%  Usage
%    do_action(action_switch)
%
do_global;
if action_switch == 1,
   figure(fig_hand2); 
   wc = FWT_PO(x_use,4,QMF_Filter); clf;
   PlotWaveCoeff(wc,4,0.);
	signaltitle = [ 'Wavelet Transform of ' signal_name];
	title(signaltitle);  
elseif action_switch == 2,
   figure(fig_hand2); clf;
   wc = FWT_PO(x_use,4,QMF_Filter); clf;
   PlotMultiRes(wc,4,0.,QMF_Filter);
	signaltitle = [ 'MRA  of ' signal_name];
	title(signaltitle);  
elseif action_switch == 3,
   figure(fig_hand2);
   cc = dct_iv(x_use); clf;
   plot(cc);
	signaltitle = [ 'Cosine Transform of ' signal_name];
	title(signaltitle);  
elseif action_switch == 4,
   D = 6;
   wp = WPAnalysis(x_use,D,QMF_Filter);
   figure(fig_hand2); clf;
	PlotPacketTable(wp);
	signaltitle = [ 'Wavelet Packet Decomposition of ' signal_name];
	title(signaltitle); ylabel('Split Level'); xlabel('Frequency[Time]')
%
	figure(fig_hand1); clf;
	stree = CalcStatTree(wp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);
	signaltitle = [' WP Best Basis; ' signal_name];
	PlotBasisTree(btree,D,stree,signal_name);
	xlabel('Frequency Domain Splits')
	ylabel('Entropy Drop')
%
	figure(fig_hand3); clf;
	ImagePhasePlane('WP',btree,wp,signal_name)
elseif action_switch ==5,
   D = 6;
   cp = CPAnalysis(x_use,D,'Sine');
   figure(fig_hand2); clf;
	PlotPacketTable(cp);
	signaltitle = [ 'Cosine Packet Decomposition of ' signal_name];
	title(signaltitle); ylabel('Split Level'); xlabel('Time[Frequency]')
%
	figure(fig_hand1);
	stree = CalcStatTree(cp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);
	signaltitle = [' CP Best Basis; ' signal_name];
	clf; PlotBasisTree(btree,D,stree,signal_name);
	xlabel('Time Domain Splits')
	ylabel('Entropy Drop')
%
	figure(fig_hand3); clf;
	ImagePhasePlane('CP',btree,cp,signal_name)
elseif action_switch==6,
    do_wtcompress;
elseif action_switch==7,
    do_shrinkage;
elseif action_switch==8,
    do_wpcompress;
elseif action_switch==9,
    do_cpcompress;
elseif action_switch==10,
    close(fig_hand3);
	close(fig_hand2);
	close(fig_hand1);
	close(PlotFig);
	clr_global;
end


%  Revision History
%             10/1/05     AM     Changing the name of the variable QMF and
%                                switch  to QMF_Filter and action_switch
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
