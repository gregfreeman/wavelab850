function wavepkt = MakeWaveletPacket(d,b,k,Family,par,n)
% MakeWaveletPacket -- Make periodized orthogonal wavelet packet
%  Usage
%    wavepkt = MakeWaveletPacket(d,b,k[,Family,par,n])
%    wavepkt = MakeWaveletPacket(d,b,k,qmf[,n])
%  Inputs
%    d,b,k     1-d packet index
%    Family    Wavelet Family name  (Default 'Symmlet')
%    par       Family Parameter     (Default 8)
%    qmf       quadrature mirror filter
%    n         signal length        (>> 2^d)
%  Outputs
%    wavepkt   1-d signal; the requested wavelet packet
%
%  Description
%    This function returns the wavelet packet basis element
%    corresponding to position (d,b,k) in the WP table.
%
%  See Also
%     WPAnalysis, WPSynthesis
%

	if nargin < 4,
	   Family = 'Symmlet';
	   par    = 8;
	end
%
	if isstr(Family)
		qmf = MakeONFilter(Family,par);
		maxnarg = 6;
		if nargin < maxnarg,
		   n = 2^(d+5);
		end	
	else
		qmf = Family;
		maxnarg = 5;
		if nargin < maxnarg,
		   n = 2^(d+5);
		else
			n = par;
		end
	end
%
	L   = d+1;
	wp  = zeros(n,L);
	wp  = WPImpulse(wp,d,b,k,qmf);
	wavepkt = wp(:,1)';

%
% Copyright (c) 1993-4. Jonathan Buckheit and David Donoho
%
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
