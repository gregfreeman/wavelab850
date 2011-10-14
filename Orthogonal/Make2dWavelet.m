function wave2d = Make2dWavelet(j,k1,k2,ep,Family,par,n)
% Make2dWavelet -- Make 2-d Wavelet
%  Usage
%    wave2d = Make2dWavelet(j,k1,k2,ep[,Family,par,n])
%  Inputs
%    j        resolution level
%    k1,k2    spatial indices
%    ep       spatial orientation
%             ep = 0:  Father(x)Father(y)
%                  1:  Mother(x)Father(y)
%                  2:  Father(x)Mother(y)
%                  3:  Mother(x)Mother(y)
%    Family   string: 'Haar', 'Daubechies', 'Coiflet', 'Symmlet', 'Meyer'
%             Default: 'Symmlet', Nearly-Symmetric ON Wavelet
%    par      integer parameter to MakeONFilter, etc.
%             When Default 'Symmlet' active, default 8.
%    n        image side length (dyadic)
%  Outputs
%    wave2d   2-d image, the wavelet
%

    if nargin < 7,
       n = 2^(j+3)
    end
    if nargin < 5,
       Family = 'Symmlet';
       par    = 8;
    end
    %
    if strcmp(Family,'Haar') + strcmp(Family,'Daubechies') ...
       + strcmp(Family,'Coiflet') + strcmp(Family,'Symmlet') ,
        qmf = MakeONFilter(Family,par);
        w = zeros(n,n);
        [kx,ky]=quad2ix(j,k1,k2,ep);
  		w(kx,ky)=1;
        wave2d = IWT2_PO(w,j,qmf);
    %
    elseif strcmp(Family,'Meyer') ,
        w = zeros(n,n);
        w(quad2ix(j,k1,k2,ep)) = 1;
        wave2d = IWT2_YM(w,j,par);
    end
    
%
% Copyright (c) 1995. Jonathan Buckheit
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
