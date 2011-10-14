function WTCh09Demo
% WTCh09Demo -- Demo Browser for chapter 9.
%  Usage
%    WTCh09Demo
%  Inputss
%    none
%  Outputs
%    none
%

choice=menu('Chapter 9 : which figure?', 'figure 1', 'figure 2', ...
    'figure 3', 'figure 4', 'figure 5','figure 7', 'figure 8', ...
    'figure 9','figure 10', 'Exit Chapter 9');

switch(choice);
  case(1), wt09fig01,WTCh09Demo;
  case(2), wt09fig02,WTCh09Demo;
  case(3), wt09fig03,WTCh09Demo;
  case(4), wt09fig04,WTCh09Demo;	
  case(5), wt09fig05,WTCh09Demo;
  case(6), wt09fig07,WTCh09Demo;
  case(7), wt09fig08,WTCh09Demo;
  case(8), wt09fig09,WTCh09Demo;
  case(9), wt09fig10,WTCh09Demo;
  case(10), close all;
end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
