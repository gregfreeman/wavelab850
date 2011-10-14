function a2 = AIRefine(a,D,Filter,EdgeFilter)
% AIRefine -- Average-Interpolating Refinement Scheme
%  Usage
%    fine = AIRefine(coarse,D,Filter,EF)
%  Inputs
%    coarse    1-d signal at a coarse scale: length(coarse)=n
%    D         D degree of polynomials used for interpolation
%    Filter    interpolating filter from MakeAIFilter(D)
%    EF        Boundary filter from MakeAIBdryFilter(D)
%  Outputs
%    fine      1-d signal at a fine scale: length(fine) = 2*n
%
%  Description
%    Average-Interpolating Refinement scheme is used to refine boxcar
%    averages on a grid of n points, imputing averages on a finer grid
%    of 2n points.
%
%    The average of imputed pairs at (2*i-1,2i) at fine scale reproduce
%    values i at the coarse scale; the pairs are obtained by polynomial
%    interpolation of the coarse averages near i.
%
%  See Also
%    AIDyadUp, AIDyaAIown, FWT_AI, IWT_AI
%
	n = length(a); n2 = 2*n; a2 = zeros(1,n2);
	ae = [ a; 0 .*a ]; ae = ae(:)'; 
	temp = conv(Filter,ae);
	a2((D+1):(n2-D)) = temp((2*D+1):(n2));
%
% Adjustments at edges
%
	a2(1:D) = EdgeFilter * (a(1:(D+1))');
	a2((n2-D+1):n2) = reverse(EdgeFilter * (reverse(a((n-D):n))'));
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
