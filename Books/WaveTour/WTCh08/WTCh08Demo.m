function WTCh08Demo
% WTCh08Demo -- Demo Browser for chapter 8.
%  Usage
%    WTCh08Demo
%  Inputss
%    none
%  Outputs
%    none
%

choice=menu('Chapter 8 : which figure?', 'figure 2', 'figure 4', ...
    'figure 6','figure 8', 'figure18','figure 21', ...
    'Exit Chapter 8');

switch(choice);
  case(1), wt08fig02,WTCh08Demo;
  case(2), wt08fig04,WTCh08Demo;
  case(3), wt08fig06,WTCh08Demo;
  case(4), wt08fig08,WTCh08Demo;
  case(5), wt08fig18,WTCh08Demo;
  case(6), wt08fig21,WTCh08Demo;  
  case(7), close all;
end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
