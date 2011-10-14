function [clean,bb,st] = CPDeNoise(x,D,bell)
% CPDeNoise -- De-Noising in an adaptively chosen CP basis
%  Usage
%    [clean,bb,st] = CPDeNoise(x,D,bell)
%  Inputs
%    x       1-d signal to be de-noised.
%    D       maximum allowed depth of basis tree
%    bell    bell for time splitting
%  Outputs
%    clean   cleaned signal
%    bb      basis tree naming basis in which de-noising was done
%    st      stat tree: statistics driving basis search
%
%  Description
%    1. Assumes noise level == 1
%    2. Uses Stein Unbiased Estimate of risk to evaluate basis
%    3. Uses Coifman-Wickerhauser Best Basis algorithm to select
%       best basis
%
% See Also
%    WaveShrink, WPDeNoise
%
	[n,J] = dyadlength(x); 
	thr = sqrt(2 .* log( n .* J) );
%
%   Find Best Basis for De-Noising
%
	cp      = CPAnalysis(x,D,bell);
	st      = CalcStatTree(cp,'SURE',thr);
	[bb,vt] = BestBasis(st,D);
%
%   Apply thresholding in Best Basis
%
	dirtycoef = UnpackBasisCoeff(bb,cp);
	cleancoef = HardThresh(dirtycoef,thr);
%
%   Transform back to time domain
%
	cleancp   = PackBasisCoeff(bb,cp,cleancoef);
	clean     = CPSynthesis(bb,cleancp,bell);      

%
% Copyright (c) 1993-5.  Jonathan Buckheit, David Donoho and Iain Johnstone
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
