function [beta,alfa] = DDDyadDown(afine,D,F,LEF,REF)
% DDDyadDown -- Deslauriers-Dubuc Interpolating DownSampling Operator
%  Usage
%    [beta,alfa] = DDDyadDown(afine,D,F,LEF,REF)
%  Inputs
%    afine   fine-scale samples
%    D       degree of polynomial fit in  DD interpolation
%    F       filter implementing DD-interpolation
%    LEF     Left edge filter for DD-interpolation
%    REF     Right edge filter for DD-interpolation
%  Outputs
%    beta    coarse-scale samples
%    alfa    detail corrections
%
%  Description
%    Splits information afine on fine scale samples into coarse
%    scale samples beta and gen. midpoint deflections alfa.
%
%  See Also
%    IWT_DD, DDRefine, MakeDDFilter
% 
	
	n = length(afine);
	acoarse = afine(1:2:(n-1));
	ahat = DDRefine(acoarse,D,F,LEF,REF);
	adif = afine - ahat;
	alfa = sqrt(2) .* adif(2:2:n);
	beta = sqrt(2) .* acoarse;
    
    
%
% For Article "Interpolating Wavelet Transforms"
% Copyright (c) 1993. David L. Donoho
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
