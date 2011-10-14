function [thresh,magic,scale] = MultiSUREThresh(wcoef,L)
% MultiSUREThresh -- 
%  Usage
%     [thresh,magic,scale] = MultiSUREThresh(wcoef,L)
% 
%  Inputs
%     wcoef     wavelet coefficients from an orthogonal wavelet transform
%     L		Low-Frequency cutoff for calculating scales, thresholds etc
%
%  Outputs 
%     scale	Med Abs Dev of wav coeffs in each level (from L thru J-1)
%     magic     scale(i) * sqrt{ 2 log ni}  (ni = no. coeffs in level)
%     thresh 	scale(i) * SURE(i)  (NOTE, NOT hybrid value!!)
% 
%  Description
%     For each level from L thru J-1, first calculate the scale
%     of the wavelet coefficients on that level (using median absolute
%     deviation from median).
%     Then compute two thresholds: the "magic" threshold based on      
%     sqrt( 2* no. coeffs in level), and the "SURE" threshold based
%     on minimising an unbiased estimate of risk.
%     Note that output vectors have length J-1, with zeros in slots below L.

[n,J] = dyadlength(wcoef) ;

thresh  = zeros( size(1:(J-1)) );
magic  = zeros( size(1:(J-1)) );
scale  = zeros( size(1:(J-1)) );

for i = L:(J-1)
	ni = length(wcoef(dyad(i)));
%	scale(i) = std( wcoef(dyad(i)) );
	scale(i) = MAD( wcoef(dyad(i)) );
        magic(i) = scale(i) * sqrt( 2* log( ni) );
        [what, thr] = SUREThresh( wcoef(dyad(i))' ./ scale(i) );
        thresh(i) = scale(i) * thr;
end

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
