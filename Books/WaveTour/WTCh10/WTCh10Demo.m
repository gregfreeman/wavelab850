function WTCh10Demo
% WTCh10Demo -- Demo Browser for chapter 10.
%  Usage
%    WTCh10Demo
%  Inputss
%    none
%  Outputs
%    none
%

choice=menu('Chapter 10 : which figure?', 'figure 1', 'figure 2', ...
    'figure 3','figure 4','figure 5', 'figure 7 ',...
    'figure 9','figure 11','figure 12', 'figure 13', ...
    'figure 14', 'figure 15', ...
    'Exit Chapter 10');

switch(choice);
  case(1), wt10fig01, WTCh10Demo;
  case(2), wt10fig02, WTCh10Demo;
  case(3), wt10fig03, WTCh10Demo;
  case(4), wt10fig04, WTCh10Demo;
  case(5), wt10fig05, WTCh10Demo;
  case(6), wt10fig07, WTCh10Demo;
  case(7), wt10fig09, WTCh10Demo;
  case(8), wt10fig11, WTCh10Demo;
  case(9), wt10fig12, WTCh10Demo;
  case(10), wt10fig13, WTCh10Demo;   
  case(11), wt10fig14, WTCh10Demo; 
  case(12), wt10fig15, WTCh10Demo;
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
