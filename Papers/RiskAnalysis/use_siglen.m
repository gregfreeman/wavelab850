function use_siglen(m)
%   use_siglen --- Used  to define the length of the Signal in RiskBrowser
%   
risk_global; global h_lenmenu x_length x_use sigchoice
%
nm = 32;
for i=1:6,
  nm = 2*nm;
  if m==nm,
      set(h_lenmenu(i),'Checked','on');
      x_length = m;
   else 
       set(h_lenmenu(i),'Checked','off');
   end
end
if m == 2048,
   for i=1:5,
     set(h_lenmenu(i),'Checked','off');
   end
   set(h_lenmenu(6),'Checked','on');
x_length = input('What is the length of the signal ?');
   if (x_length ~= 2^floor(log2(x_length))),
disp('***************************************************************');
disp('*The signal length that you have specified is not a power of 2*');
disp('*        This world recognizes only dyadic numbers            *');
disp('*        The signal generated is of dyadic length             *,');
disp('*        closest to the number specified                      *');
disp('***************************************************************');
    x_length1 = 2^floor(log2(x_length));
    x_length2 = 2^ceil(log2(x_length));
    x_lengthav = mean([x_length1,x_length2]);
    if x_length <= x_lengthav 
         x_length = x_length1;
    else 
        x_length = x_length2;
    end
   end
end
%
displength = num2str(x_length);
disp('***************************************************************');
disp(['*  The length setting for use = ' displength '               *']);
disp('***************************************************************');

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
