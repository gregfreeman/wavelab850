% vdlfig01 -- Plot of Doppler Signal
%
% Display the Doppler signal built-into WaveLab.
%
% Distribution of datasets, both synthetic and real, is a crucial
% part of reproducibility.  Here we illustrate one interface to
% retrieving such data from WaveLab.
%

doppler = MakeSignal('Doppler',1024);
plot(doppler);
title('Figure 1: Doppler Signal');

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
