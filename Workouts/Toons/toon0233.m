% toon0233 -- Visualize Wavelet Xform
%
%  Here we display a 2-d image and its 2-d wavelet transform
%
ingrid = ReadImage('Daubechies');
%
clf; subplot(121);
GrayImage(ingrid);
title('Ingrid Daubechies');
%
%
Q = MakeONFilter('Coiflet',2);
wingrid = FWT2_PO(ingrid,3,Q);
%
%
subplot(122);
zmat = abs(wingrid);
GrayImage(zmat); brighten(.5);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
