function value = SNR(sig1,sig2)
%  SNR- Signal/Noise ratio
%  Usage
%    value=SNR(sig1,sig2)
%  Inputs   
%    sig1	Original reference signal
%    sig2	Restored or noisy signal
%  Outputs
%    value	Signal/Noise ratio.
%


value=20*log10(norm(sig1)/norm(sig1-sig2));

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
