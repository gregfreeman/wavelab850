function def_siglen(m)
% def_siglen -- Called by WLBrowser
%  Usage
%    def_siglen(m)
%
do_global; global h_sigmenu nsig
%
nm = 256;
for i=1:5,
  nm = 2*nm;
  if m==nm,
      set(h_sigmenu(i),'Checked','on');
   else 
       set(h_sigmenu(i),'Checked','off');
   end
end
%
nsig = m;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
