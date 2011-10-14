function do_button(type)
% do_button -- Called by WLBrowser
%  Usage
%    do_button(type)
%

global HC n
if     strcmp(type,'slider')
    f = get(HC,'value');
    update_plot(f);
elseif strcmp(type,'double')
    p = get(gcf,'UserData');
	f = get(HC,'value'); 
	p(3) = min(p(3)*2, (length(p)-3)/2);
	set(gcf,'UserData',p);
	update_plot(f);
elseif strcmp(type,'half')
    p = get(gcf,'UserData');
	f = get(HC,'value'); 
	p(3) = max(p(3)/2, 16);
	set(gcf,'UserData',p);
	update_plot(f);
elseif strcmp(type,'next')
    p = get(gcf,'UserData');
	f = get(HC,'value')+2*(p(3)/n);
	f = min([max([f 0]) 1]);
	update_plot(f); 
	set(HC,'value',f)
elseif strcmp(type,'prev')
    p = get(gcf,'UserData');
	f = get(HC,'value')-2*(p(3)/n);
	f = min([max([f 0]) 1]);
	update_plot(f); 
	set(HC,'value',f)
elseif strcmp(type,'full')
    p=get(gcf,'UserData'); 
	set(HC,'value',1/2); 
	p(3) = n/2;
	set(gcf,'UserData',p);
	update_plot(get(HC,'value'));
elseif strcmp(type,'play')
    f=get(HC,'value');
	sonify(n);
elseif strcmp(type,'zoom')
    NewZoom;
end
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
