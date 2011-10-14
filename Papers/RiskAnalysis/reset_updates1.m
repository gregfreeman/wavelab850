global upd_never upd_ever Update

   set(upd_ever,'Value',1 - get(upd_never,'Value'));

if get(upd_never,'Value') == 1,
  Update = 'Never';
else 
  Update = 'ever';
end;

  
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
