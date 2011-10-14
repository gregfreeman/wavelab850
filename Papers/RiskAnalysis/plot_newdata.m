function plot_new_data

	global PlotFig x_use HC x_length x_name 
        figure(PlotFig);
	ntmp = zeros(1,x_length+3);
	ntmp(1) = min(min(x_use));
	ntmp(2) = max(max(x_use));
	ntmp(3) = x_length;
	ntmp(4:(x_length+3)) = x_use(:);
	set(PlotFig,'UserData',ntmp);
        HC = ...
    uicontrol('style','slider','units','normal','pos',[.05,.05,.9,.05],...
    'min',0,'max',1,'value',.5,...
    'call','do_button(''slider'');');
redo_plot(get(HC,'value'));
set(PlotFig,'Name',['Signal: ' x_name]);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
