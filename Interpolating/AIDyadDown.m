function [beta,alfa] = AIDyadDown(afine,D,F,EF)
% AIDyadDown -- Average-Interpolating DownSampling Operator
%  Usage
%    [beta,alfa] = AIDyadDown(afine,D,F,EF)
%  Inputs
%    afine   fine-scale block averages
%    D       degree of polynomial fit in average-interpolation
%    F       filter implementing average-interpolation
%    EF      edge filter of average-interpolation
%  Outputs
%    beta    coarse-scale block averages
%    alfa    detail corrections
%
%  Description
%    Splits information afine on fine scale block averages into
%    coarse scale block averages beta and detail corrections alfa.
%
%  See Also
%    IWT_AI, AIRefine, MakeAIFilter
% 
	n = length(afine);
	acoarse = (afine(1:2:(n-1)) + afine(2:2:n)) ./ 2;
	ahat = AIRefine(acoarse,D,F,EF);
	adif = afine - ahat;
	alfa = sqrt(2) .* adif(2:2:n);
	beta = sqrt(2) .* acoarse;

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
