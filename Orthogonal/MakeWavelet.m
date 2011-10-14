function wave = MakeWavelet(j,k,Family,par,Gender,n)
% MakeWavelet -- Make periodized orthogonal wavelet
%  Usage
%    wave = MakeWavelet(j,k [,Family,par,Gender,n])
%  Inputs
%    j,k      location-scale indices: 2^{-j} approx width of wavelet
%             k/2^j approx loc'n of wavelet on unit interval
%    Family   string: 'Haar', 'Daubechies', 'Coiflet', 'Symmlet',
%             'Interpolating', 'AverageInterpolating', 'Meyer', 'Battle'
%             Default: 'Symmlet', Nearly-Symmetric ON Wavelet
%    par      integer parameter to MakeONFilter, MakeDDFilter. 
%             When Default 'Symmlet' active, default 8.
%
%    Gender   'Mother', 'Father'
%    n        signal length (dyadic)
%  Outputs
%    wave     1-d signal, the wavelet
%
%  Description
%    The Haar filter (which could be considered a Daubechies-2) was the
%    first wavelet, though not called as such, and is discontinuous.
%
%    The Coiflet filters are designed to give both the mother and father
%    wavelets 2*Par vanishing moments; here Par may be one of 1,2,3,4 or 5.
%
%    The Daubechies filters are minimal phase filters that generate wavelets
%    which have a minimal support for a given number of vanishing moments.
%    They are indexed by their length, Par, which may be one of
%    4,6,8,10,12,14,16,18 or 20. The number of vanishing moments is par/2.
%
%    Symmlets are also wavelets within a minimum size support for a given 
%    number of vanishing moments, but they are as symmetrical as possible,
%    as opposed to the Daubechies filters which are highly asymmetrical.
%    They are indexed by Par, which specifies the number of vanishing
%    moments and is equal to half the size of the support. It ranges 
%    from 4 to 10.
%
%    The Battle-Lemarie filter generate spline orthogonal wavelet basis.
%    The parameter Par gives the degree of the spline. The number of 
%    vanishing moments is Par+1.
%
%    The Meyer wavelet has an infinite number of vanishing moments. The time
%    decay  depends upon the regularity of the spectral window used to build
%    it. In this case, these windows are built with polynomials whose degree
%    are given by the parameter Par.
%
%    The Interpolating wavelets are Dubuc-Deslauriers wavelets which are
%    interpolating functions that can reproduce polynomials of degree
%    equal to Par.
%

    if nargin < 6,
       n = 2^(j+3)
    end
    if nargin < 3,
       Family = 'Symmlet';
       par    = 8;
       Gender = 'Mother';
    end
    %
    if strcmp(Family,'Haar') + strcmp(Family,'Daubechies') ...
       + strcmp(Family,'Coiflet') + strcmp(Family,'Symmlet') ...
       + strcmp(Family,'Battle'),
        qmf = MakeONFilter(Family,par);
        if strcmp(Gender,'Mother'),
            w = zeros(1,n);
            w(dyad2ix(j,k)) = 1;
            wave = IWT_PO(w,j,qmf);
        else
            w = zeros(1,n);
            w(k) =1;
            wave = IWT_PO(w,j,qmf);
        end
    elseif strcmp(Family,'Interpolating') ,
        F   = MakeDDFilter(par);
        [LEF,REF] = MakeDDBdryFilter(par);
        if strcmp(Gender,'Mother'),
            w = zeros(1,n);
            w(dyad2ix(j,k)) = 1;
            wave = IWT_DD(w,j,par,F,LEF,REF);
        else
            w = zeros(1,n);
            w(k) =1;
            wave = IWT_DD(w,j,par,F,LEF,REF);
        end     
    elseif strcmp(Family,'AverageInterpolating') ,
        F    = MakeAIFilter(par);
        EF   = MakeAIBdryFilter(par);
        if strcmp(Gender,'Mother'),
            w = zeros(1,n);
            w(dyad2ix(j,k)) = 1;
            wave = IWT_AI(w,j,par,F,EF);
        else
            w = zeros(1,n);
            w(k) =1;
            wave = IWT_AI(w,j,par,F,EF);
        end     
    elseif strcmp(Family,'Meyer') ,
        if strcmp(Gender,'Mother'),
            w = zeros(1,n);
            w(dyad2ix(j,k)) = 1;
            wave = IWT_YM(w,j,par);
        else
            w = zeros(1,n);
            w(k) =1;
            wave = IWT_YM(w,j,par);
        end     
    elseif strcmp(Family,'CDF') ,
	[qmf,dqmf]   = MakeBSFilter('CDF',par(1:2));
	if par(3)
	  qmf2 = qmf;
	  qmf  = dqmf;
	  dqmf = qmf2;
	end
% here par must be a vector of length 3 
% (first 2 coord: normal parameters, 
% 3rd coord: 1 -> dual biorthogonal wavelet and 
%            0 -> biorthogonal wavelet)
 	if strcmp(Gender,'Mother'),
            w = zeros(1,n);
            w(dyad2ix(j,k)) = 1;
	    wave = IWT_PBS(w,j,qmf,dqmf);
	else
            w = zeros(1,n);
            w(k) =1;
	    wave = IWT_PBS(w,j,qmf,dqmf);
	end
    
 
      elseif strcmp(Family,'Dyadic'), % DOESN'T WORK YET
%    [lodyadf,dlodyadf,hidyadf,dhidyadf] = MakeDyadFilter('Spline',par(1));
% here par must be a vector of length 2 
% (first  coord: normal parameter, 
% 2nd coord: 1 -> dual biorthogonal wavelet and 
%            0 -> biorthogonal wavelet)
 	if strcmp(Gender,'Mother'),
	    w = zeros(n,log2(n)-j+1);
            w(dyad2ix(j,k),log2(n)-j+1) = 1;
	    wave = IWT_ATrou(w,j);
	else
            w = zeros(n,log2(n)-j+1);
            w(k,log2(n)-j+1) = 1;
	    wave = IWT_ATrou(w,j);
	end
   elseif strcmp(Family,'CDJV'),
	if strcmp(Gender,'Mother'),
	    w = zeros(1,n);
            w(dyad2ix(j,k)) = 1;
	    wave = IWT_CDJV(w,j,par);
	else
            w = zeros(1,n);
            w(k) = 1;
	    wave = IWT_CDJV(w,j,par);
	end

      end
   

%
% Copyright (c) 1993-5. Jonathan Buckheit and David Donoho.
% 
% Modified by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
