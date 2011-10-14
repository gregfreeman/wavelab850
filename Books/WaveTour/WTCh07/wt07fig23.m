%CAPTION
fprintf('\n');
disp('Figure 7.23')
disp('Multiresolution approximations a_j[n,m] of an image')
disp('at scales 2^j, for 5>j>0.')

close all;
global WLVERBOSE;
WLVERBOSE='No';
Image = ReadImage('Lenna');
[n,J] = quadlength(Image);
qmf = MakeONFilter('Daubechies',8);
L = 5;
wc = FWT2_PO(Image,L,qmf);
figure(1);clf
Display2dProjV(wc,L,qmf);
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
