function def_nonlin(m)
% def_nonlin -- Called by WLBrowser
%  Usage
%    def_nonlin
%
do_global; global h_nonmenu

for i=1:2
  set(h_nonmenu(i),'Checked','off');
end
set(h_nonmenu(m),'Checked','on');
nonlin_type = m;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
