function WTCh05Demo
% WTCh05Demo -- Demo Browser for chapter 5.
%  Usage
%    WTCh05Demo
%  Inputss
%    none
%  Outputs
%    none
%

choice=menu('Chapter 5 : which figure?', 'figure 4', 'figure 5', ...
    'figure 6','Exit Chapter 5');

switch(choice);
  case(1), wt05fig04,WTCh05Demo;
  case(2), wt05fig05,WTCh05Demo;
  case(3), wt05fig06,WTCh05Demo;
  case(4), close all;
end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
