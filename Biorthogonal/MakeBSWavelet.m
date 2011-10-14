function wave = MakeBSWavelet(j,k,Family,par,Gender,n)
% MakeWavelet -- Make periodized orthogonal wavelet
%  Usage
%    wave = MakeWavelet(j,k [,Family,par,Gender,n])
%  Inputs
%    j,k      location-scale indices: 2^{-j} approx width of wavelet
%             k/2^j approx loc'n of wavelet on unit interval
%    Family   string: 'CDF'
%    par      a vector of length 3 
%             (first 2 coord: normal parameters, 
%             3rd coord: 1 -> dual biorthogonal wavelet and 
%                        0 -> biorthogonal wavelet)
%    Gender   'Mother', 'Father'
%    n        signal length (dyadic)
%  Outputs
%    wave     1-d signal, the wavelet
%
    if nargin < 6,
       n = 2^(j+3)
    end
     
    if strcmp(Family,'CDF') ,
	[qmf,dqmf]   = MakeBSFilter('CDF',par(1:2));
	if par(3)
	  qmf2 = qmf;
	  qmf  = dqmf;
	  dqmf = qmf2;
	end
 	if strcmp(Gender,'Mother'),
            w = zeros(1,n);
            w(dyad2ix(j,k)) = 1;
	    wave = IWT_PBS(w,j,qmf,dqmf);
	else
            w = zeros(1,n);
            w(k) =1;
	    wave = IWT_PBS(w,j,qmf,dqmf);
	end
    

      end
%
% Copyright (c) 1993-5. Jonathan Buckheit and David Donoho.
% 
% Modified by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
