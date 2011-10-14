function sig = IRWT(rwt,scale)
% iRWT -- Inverse Real Wavelet Transform
%  Usage
%    sig = iRWT(rwt,scale);
%  Inputs
%    rwt	matrix n by nscale, output from RWT.m
%    scale	real signal, complementary part, output from RWTscale.m
%  Output
%    sig	1-d real signal. 
%  Side Effects
%  Description
%    We did not really calculate the scaling function. In fact, scale is 
%    a record of residual in Frequency Domain.
%    Why not use scaling function,
%	1. complicated to implement;
%	2. differ with various window, what's the difference in tracing
%	   a residual in Frequency domain than in space expanded by scaling
%	   function.
%  Algorithm
%    The result is PSEUDO Inverse Real Wavelet Transform. 
%  Examples
%     CantorMeasure = MakeFractal(1024,3,'Deterministic',[.5 0 .5]);
%     Devil  = cumsum(CantorMeasure); 
%     Devil_rwt = RWT(Devil,12,'Sombrero');
%     scale = RWTscale(Devil,Devil_rwt);
%     sig = iRWT(Devil_rwt,scale); 
%     subplot(211);  	plot(Devil);    
%     subplot(212);	plot(sig);
%  See Also
%    RWT   RWTscale
%  Description
%    Reconstruct original signal from Continuous Wavelet Transform
%  References
%    Mallat, "A Wavelet Tour of Signal Processing"; 4.3.1 Real Wavelets.
%
%

 sz = size(rwt);
 
 fftsig = fft(scale(:));
 for i = 1:sz(2),
        fftsig = fftsig + fft(rwt(:,i));
 end;
 sig = real(ifft(fftsig));


%
% Copyright (c) 1996. Xiaoming Huo
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
