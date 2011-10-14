function fbm = MakeBrownian(N,H)
% MakeBrownian -- Create Fractional Brownian Signal
%  Usage
%    fBr = MakeBrownian(n,H)
%  Inputs
%    n       signal length
%    H       fbm exponent (0<H<1)
%  Outputs
%    fbm     the generated signal
%
% Description : uses a direct convolution.
  
    epsilon=0.0000000001;

ix=(-N:N-1);
u=(ix>=zeros(1,2*N));
v=u.*((max(ix,epsilon)/(N-1)).^(H-0.5));
fbm=conv(v,randn(2*N,1));
fbm=fbm(N+1:2*N);
%
% Written June 7, 1996 (Maureen Clerc)
%

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
