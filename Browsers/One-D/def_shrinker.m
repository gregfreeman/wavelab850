function def_shrinker(m)
% def_shrinker -- Called by WLBrowser
%  Usage
%    def_shrinker(m)
%
global shrinkage_type h_thrmenu
for i=1:5
  set(h_thrmenu(i),'Checked','off');
end
set(h_thrmenu(m),'Checked','on');

shrinker_type = m;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
