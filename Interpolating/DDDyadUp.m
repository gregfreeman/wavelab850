function afine = DDDyadUp(beta,alfa,D,F,LEF,REF)
% DDDyadUp -- Interpolating UpSampling Operator
%  Usage
%    afine = DDDyadUp(beta,alfa,D,F,LEF,REF)
%  Inputs
%    beta    coarse-scale samples
%    alfa    midpoint deflections
%    D       degree of polynomial fit in interpolation
%    F       filter implementing DD-interpolation
%    LEF     left edge filter of DD-interpolation
%    REF     right edge filter of DD-interpolation
%  Outputs
%    afine   fine-scale samples
%
%  Description
%    Implements the Coarse-to-Fine phase of the interpolating
%    Wavelet Transform. Takes coarse scale samples and midpoint
%    corrections and synthesizes fine-scale samples.
%
%  See Also
%    IWT_DD, DDRefine, MakeDDFilter
% 
	n = length(beta);
	ahat = DDRefine(beta,D,F,LEF,REF);
	adif =  [zeros(1,n) ; alfa ]; adif = adif(:)';
	afine = ahat + adif;
	afine = afine ./sqrt(2);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
