function plot_new_data
% plot_new_data -- Called by WLBrowser
%  Usage
%    plot_new_data
%
	global PlotFig x_use HC n signal_name

	ntmp = zeros(1,n+3);
	ntmp(1) = min(min(x_use));
	ntmp(2) = max(max(x_use));
	ntmp(3) = min(n/2,2048);
	ntmp(4:(n+3)) = x_use(:);
	set(PlotFig,'UserData',ntmp);
	update_plot(get(HC,'value'));
	set(PlotFig,'Name',['Signal: ' signal_name]);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
