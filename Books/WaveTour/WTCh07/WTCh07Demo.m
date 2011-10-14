function WTCh07Demo
% WTCh07Demo -- Demo Browser for chapter 7.
%  Usage
%    WTCh07Demo
%  Inputss
%    none
%  Outputs
%    none
%

choice=menu('Chapter 7 : which figure?', 'figure 1', 'figure 2', ...
    'figure 3','figure 4','figure 5','figure 6', 'figure 7', ...
    'figure 8', 'figure 9', 'figure 10', 'figure 11', ...
    'figure 14','figure 15','figure 20', 'figure 21', ...
    'figure 22', 'figure 23', 'figure 24', 'figure 26', ...
    'Exit Chapter 7');

switch(choice);
  case(1), wt07fig01,WTCh07Demo;
  case(2), wt07fig02,WTCh07Demo;
  case(3), wt07fig03,WTCh07Demo;
  case(4), wt07fig04,WTCh07Demo;
  case(5), wt07fig05,WTCh07Demo;
  case(6), wt07fig06,WTCh07Demo;
  case(7), wt07fig07,WTCh07Demo;
  case(8), wt07fig08,WTCh07Demo;
  case(9), wt07fig09,WTCh07Demo;
  case(10), wt07fig10,WTCh07Demo;
  case(11), wt07fig11,WTCh07Demo;
  case(12), wt07fig14,WTCh07Demo;
  case(13), wt07fig15,WTCh07Demo;
  case(14), wt07fig20,WTCh07Demo;
  case(15), wt07fig21,WTCh07Demo;
  case(16), wt07fig22,WTCh07Demo;
  case(17), wt07fig23,WTCh07Demo;
  case(18), wt07fig24,WTCh07Demo;
  case(19), wt07fig26,WTCh07Demo;
  case(20), close all;
end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
