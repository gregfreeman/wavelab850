function [xh,wcoef]  = WaveShrink(y,type,L,qmf)
% WaveShrink -- Soft Threshold Shrinkage Applied to Wavelet Coefficients
%  Usage 
%    [xh,xwh] = WaveShrink(y,type,L,qmf)
%  Inputs
%    y      1-d signal. length(y)= 2^J
%               Normalized to noise level 1! (See NoiseNorm)
%    type   string. Type of shrinkage applied:
%               'Visu','SURE','Hybrid','MinMax','MAD'
%               Optional; default == 'Visu'
%    L      Low-Frequency cutoff for shrinkage (e.g. L=4)
%               Should have L << J!
%    qmf    Quadrature Mirror Filter for Wavelet Transform
%               Optional, Default = Symmlet 8.
%  Outputs 
%    xh     estimate, obtained by applying soft thresholding on
%           wavelet coefficients
%    xwh    Wavelet Transform of estimate
%
%  Description
%    WaveShrink smooths noisy data presumed to have noise level 1
%    by transforming it into the wavelet domain, applying soft
%    thresholding to the wavelet coefficients and inverse transforming.
%
%    The theory underlying these methods is described in a variety of
%    papers by D.L. Donoho and I.M. Johnstone.
%
%    The different methods of selecting thresholds are detailed
%    in their articles.
%
%  See Also
%        FWT_PO, IWT_PO, MakeONFilter, NoiseNorm, RigorShrink
%
  if nargin < 2,
      type = 'Visu';
  end
  if nargin < 3,
      L = 3;
  end
  if nargin < 4,
      qmf = MakeONFilter('Symmlet',8);
  end
%
  [n,J] = dyadlength(y) ;
  wcoef = FWT_PO(y,L,qmf) ;
%
  if     strcmp(type,'Visu'),
         wcoef((2^(L)+1):n) = VisuThresh(wcoef((2^(L)+1):n)) ;
  elseif strcmp(type,'SURE'),
         wcoef = MultiSURE(wcoef,L);
  elseif strcmp(type,'Hybrid'),
         wcoef = MultiHybrid(wcoef,L);
  elseif strcmp(type,'MinMax'),
         wcoef((2^(L)+1):n) = MinMaxThresh(wcoef((2^(L)+1):n)) ;
  elseif strcmp(type,'MAD'),
         wcoef = MultiMAD(wcoef,L);
  end
%
  xh    = IWT_PO(wcoef,L,qmf);

%
% Copyright (c) 1993-5.  Jonathan Buckheit, David Donoho and Iain Johnstone
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
