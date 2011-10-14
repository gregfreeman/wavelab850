function def_filter(m)
% def_filter -- Called by WLBrowser
%  Usage
%    def_filter(m)
%

do_global; global h_wavemenu

for i=1:5,
   set(h_wavemenu(i),'Checked','off')
end
set(h_wavemenu(m),'Checked','on')

filter_type = m;
if filter_type == 1
  % 'Haar'
 QMF_Filter = MakeONFilter('Haar', 1);

elseif filter_type == 4
  %'Coiflet';
  Par = 2;
   QMF_Filter = MakeONFilter('Coiflet',Par);

elseif filter_type == 5
  %'Symmlet';
  Par = 6;
  QMF_Filter = MakeONFilter('Symmlet',Par);
end
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
