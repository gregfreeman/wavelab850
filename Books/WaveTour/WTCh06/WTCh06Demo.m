function WTCh06Demo
% WTCh06Demo -- Demo Browser for chapter 6.
%  Usage
%    WTCh06Demo
%  Inputss
%    none
%  Outputs
%    none
%

choice=menu('Chapter 6 : which figure?', 'figure 1', 'figure 3', ...
    'figure 5','figure 6','figure 7','figure 8', 'figure 9', ...
    'figure 10', 'figure 11', 'figure 16', ...
    'figure 18', 'figure 20', 'Exit Chapter 6');

switch(choice);
  case(1), wt06fig01,WTCh06Demo;
  case(2), wt06fig03,WTCh06Demo;
  case(3), wt06fig05,WTCh06Demo;
  case(4), wt06fig06,WTCh06Demo;
  case(5), wt06fig07,WTCh06Demo;
  case(6), wt06fig08,WTCh06Demo;
  case(7), wt06fig09,WTCh06Demo;
  case(8), wt06fig10,WTCh06Demo;
  case(9), wt06fig11,WTCh06Demo;
  case(10), wt06fig16,WTCh06Demo;
  case(11), wt06fig18,WTCh06Demo;
  case(12), wt06fig20,WTCh06Demo;
  case(13), close all;
end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
