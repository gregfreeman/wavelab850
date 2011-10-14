% vdlfig02 -- Plot of Meyer wavelet
%
% WaveLab offers a full complement of wavelet transforms: the standard
% orthogonal periodized, standard boundary-corrected, standard periodized
% biorthogonal, the "Deslaurier-Dubuc" wavelets (based on interpolating
% schemes) and the Meyer wavelet, studied in the Stanford Ph.D. thesis
% of Eric Kolaczyk.
%
% Here we display a Meyer wavelet with a third-order polynomial window.
%

meyer=MakeWavelet(4,7,'Meyer',3,'Mother',1024);
plot(meyer);
title('Figure 2: Meyer Wavelet');

% 
% Copyright (c) 1995, Jonathan Buckheit.
% Prepared for ``WaveLab and Reproducible Research''
% for XV Recontres Franco-Belges symposium proceedings.
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
