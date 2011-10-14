function fBr = MakeBrownian(n,H,par)
% MakeBrownian -- Create Fractional Brownian Signal
%  Usage
%    fBr = MakeBrownian(n,H,par)
%  Inputs
%    n       signal length
%    H       base of digits in expansion
%    par     optional, degree of extension in algorithm, default =8.
%  Outputs
%    fBr     (pseudo) Fractional Brownian signal
%
%  Description
%    Uses a Frequency Domain algorithm to get a pseudo Brownian Motion
%    The law is NOT normalized to give unit variance to unit increments.
%
	if nargin < 3,
		par = 8;
	end
	N = n .*par;

% generate the FT of a real white noise
	w    = WhiteNoise(zeros(1,N));
	what = fft(w);

% formal fractional integral
	eta  = 2 * pi * [0:(N/2) (-(N/2)+1):(-1)] ./ N;
	eta(1) = 1;
	bhat = (abs(eta) .^ (-2*H)) .* what;
	bhat(1) = 0.;
	fBr  = ifft(bhat);

% extract a segment that is well away from the edges

	start = floor(par/2 .* n);
	stop  = start+n-1;
	fBr   = real(fBr(start:stop));

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
