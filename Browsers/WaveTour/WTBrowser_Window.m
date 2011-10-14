function WTBrowser_Window
% WTBrowser -- Mallat's "WaveLet Tour of Signal Processing" Browser
%  Usage
%    WTBrowser
%  Inputss
%    none
%  Outputs
%    none
%
%  Description
%    The "WaveLet Tour of Signal Processing" Browser implements a
%	point-and-click interface to Mallat's book functions.
%

choice=menu('"WaveLet Tour of Signal Processing" Demo : Which Chapter?', ...
    'Chapter 2 : Fourier Kingdom',  'Chapter 4 : Time Meets Frequency', ...
    'Chapter 5 : Frames', 'Chapter 6 : Wavelet Zoom' , ...
    'Chapter 7 : Wavelet Bases' ,...
    'Chapter 8 : Wavepackets and Local Cosine Bases',... 
    'Chapter 9 : An Approximation Tour',...
    'Chapter 10 : Estimations Are Approximations' , ...
    'Exit "Wavelet Tour of Signal processing" Demo');

switch(choice);
  case(1), WTCh02Demo;WTBrowser_Window;
  case(2), WTCh04Demo;WTBrowser_Window;
  case(3), WTCh05Demo;WTBrowser_Window;
  case(4), WTCh06Demo;WTBrowser_Window;
  case(5), WTCh07Demo;WTBrowser_Window;
  case(6), WTCh08Demo;WTBrowser_Window;
  case(7), WTCh09Demo;WTBrowser_Window;
  case(8), WTCh10Demo;WTBrowser_Window;
  case(9);
end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
