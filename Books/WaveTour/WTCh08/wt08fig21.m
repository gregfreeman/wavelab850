% CAPTION
fprintf('\n');
disp('Figure 8.21')
disp('The grid shows the support of the square windows')
disp('of a "best" local cosine basis selected in the local cosine quad-tree.')
fprintf('\n');

close all;
global WLVERBOSE;
WLVERBOSE='No';
img = ReadImage('Lenna');
MaxDepth = 5;
[bb,stats,coef] = CP2Tour(img,MaxDepth,'');
axis('off');
title('');
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
