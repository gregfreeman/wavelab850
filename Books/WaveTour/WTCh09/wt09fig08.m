% CAPTION
fprintf('\n');
disp('Figure 9.8')
disp('The grid shows the approximate support of square overlapping ')
disp('windows in the best local cosine basis, computed with an l^1 cost.')
disp('WARNING: this computation takes a long time.')
fprintf('\n');

close all;
global WLVERBOSE;
WLVERBOSE='No';
img = ReadImage('Barbara');

img = fliplr(img');
MaxDepth = 5;
% one must first set the entropy to 'l^p',1 in CP2Tour
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
