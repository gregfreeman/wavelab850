function def_tut
% def_tut -- Called by WLBrowser
%  Usage
%    def_tut
%  Inputs
%    none (menu item is specified by the global variable i_tut)
%  Outputs
%    none
%
%  Description
%    Toggles the on/off switch on the menu items that
%    control whether the tutorial feature is turned on or off.
%
%  Side Effects
%    Menu item is checked on/off

if i_tut == 1
  set(h_tutmenu(1),'Checked','on');
  set(h_tutmenu(2),'Checked','off');
  tutorial = 1;
else
  set(h_tutmenu(1),'Checked','off');
  set(h_tutmenu(2),'Checked','on');
  tutorial = 0;
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
