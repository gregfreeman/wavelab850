function afine = AIDyadUp(beta,alfa,D,F,EF)
% AIDyadUp -- Average-Interpolating UpSampling Operator
%  Usage
%    afine = AIDyadUp(beta,alfa,D,F,EF)
%  Inputs
%    beta    coarse-scale block averages
%    alfa    detail corrections
%    D       degree of polynomial fit in average-interpolation
%    F       filter implementing average-interpolation
%    EF      edge filter of average-interpolation
%  Outputs
%    afine   fine-scale block averages
%
%  Description
%    Implements the Coarse-to-Fine phase of the average-interpolating
%    wavelet transform. Takes coarse scale block average and detail
%    corrections and synthesizes fine-scale block averages.
%
%  See Also
%    IWT_AI, AIRefine, MakeAIFilter
% 
	n = length(beta);
	ahat = AIRefine(beta,D,F,EF);
	adif =  [(-alfa) ; alfa ]; adif = adif(:)';
	afine = ahat + adif;
	afine = afine ./sqrt(2);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
