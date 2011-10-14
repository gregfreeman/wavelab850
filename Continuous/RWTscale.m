function scale = CWTscale(sig,cwt)
% CWTscale -- Complement to Continuous Wavelet Transform
%  Usage
%    scale = CWTscale(sig,cwt);
%  Inputs
%    sig      1-d signal
%    cwt      continous wavelet transform of sig, Output from CWT(sig)
%  Outputs
%    scale    complement of continuous wavelet Transform of sig
%  Side Effects   
%  Description
%     scale = fft(sig) - sum(columns of cwt)
%  Algorithm
%     
%  Examples
%     N = 1024;     % signal length; 
%     nvoice = 12;  
%     % create a Brownian
%     CantorMeasure = MakeFractal(N,3,'Deterministic',[.5 0 .5]);
%     Devil  = cumsum(CantorMeasure); t = (.5:(N-.5))./N;
%     figure; plot(t, Devil); title(sprintf(' Devil Staircase Signal'));
%     % make CWT
%     Devil_cwt = CWT(Devil,nvoice,'Sombrero');
%     % complement to CWT
%     scale = CWTscale(Devil,Devil_cwt);
%     plot(real(scale));
%  See Also
%    CWT   iCWT
%  References
%    Mallat, "Wavelet Signal Processing"; 4.?.?
%    
 sz = size(cwt);
 
 fftsig = fft(sig(:));
 for i = 1:sz(2),
	fftsig = fftsig - fft(cwt(:,i));
 end;
 scale = (ifft(fftsig));


%
% Copyright (c) 1996. Xiaoming Huo
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
