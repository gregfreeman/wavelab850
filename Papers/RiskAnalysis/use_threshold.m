function use_threshold(m)
global h_thrmenu threshtype

for i=1:3,
  set(h_thrmenu(i),'Checked','off');
end
set(h_thrmenu(m),'Checked','on');

if m==1,
  threshtype = 'Hard';
elseif m == 2
  threshtype = 'Soft';
else 
  threshtype = 'SoftMO';
end

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
