%CAPTION
fprintf('\n');
disp('Figure 5.5')
disp('The top curve is the original signal.')
disp('Its dyadic wavelet transform is shown below at scales 2^j for 0<j<6.')
disp('The bottom curve carries the lower frequencies corresponding ')
disp('to scales larger than $2^5$.')

  close all;
  global WLVERBOSE;
  WLVERBOSE='No';
  x = ReadSignal('msignal');
  L = 3;
  dwt = FWT_ATrou(x,L);
  figure(1);clf
  DisplayDWT(dwt,4,x);
  WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
