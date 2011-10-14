function img = Make2dSignal(Name,n,par)
% Make2dSignal -- Make artificial 2d signal
%  Usage
%    sig = Make2dSignal(Name,n[,par])
%  Inputs
%    Name   string, one of:
%      'Backgammon'
%      'BoxWithCross'    (par = length of side [n/2])
%      'Checkerboard'
%      'Circle'          (par = radius [n/4])
%      'FigureEight'
%      'Mondrian'        (par = number [10])		
%      'OvalDiagonal'    (par = major/minor axes ratio [2])
%      'OvalHorizontal'  (par = major/minor axes ratio [2])
%      'OvalVertical'    (par = major/minor axes ratio [2])
%      'StickFigure'
%      'Triangle'
%      'VanishingPoint'
%    n                   desired signal dimension
%    par                 optional parameter, defaults in []'s above
%  Outputs
%    img                 n by n image
%
if nargin < 3,
  img = MakeImage(Name,n);
else,
  img = MakeImage(Name,n,par);
end;

%
% Originally made by Jonathan Buckheit.
% "MakeImage." is modified and more powerful.
%   
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
