function WTCh04Demo
% WTCh04Demo -- Demo Browser for chapter 4.
%  Usage
%    WTCh04Demo
%  Inputss
%    none
%  Outputs
%    none
%

choice=menu('Chapter 4 : which figure?', 'figure 3', 'figure 5', ...
    'figure 6','figure 7', 'figure 8', 'figure11','figure 12', ...
    'figure 13', 'figure 14','figure 15', 'figure 16', 'figure17', ...
    'figure 18', 'figure 19', 'figure 20','figure 21', 'figure 22', ...
    'Exit Chapter 4');

switch(choice);
  case(1), wt04fig03,WTCh04Demo;
  case(2), wt04fig05,WTCh04Demo;
  case(3), wt04fig06,WTCh04Demo;
  case(4), wt04fig07,WTCh04Demo;
  case(5), wt04fig08,WTCh04Demo;
  case(6), wt04fig11,WTCh04Demo;  
  case(7), wt04fig12,WTCh04Demo;
  case(8), wt04fig13,WTCh04Demo; 
  case(9), wt04fig14,WTCh04Demo;  
  case(10), wt04fig15,WTCh04Demo;
  case(11), wt04fig16,WTCh04Demo;
  case(12), wt04fig17,WTCh04Demo;
  case(13), wt04fig18,WTCh04Demo;  
  case(14), wt04fig19,WTCh04Demo;
  case(15), wt04fig20,WTCh04Demo;
  case(16), wt04fig21,WTCh04Demo;
  case(17), wt04fig22,WTCh04Demo;  
  case(18), close all;
end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
