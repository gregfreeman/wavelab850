function a2 = DDRefine(a,D,Filter,LEF,REF)
% DDRefine -- Deslauriers-Dubuc Refinement Scheme
%  Usage
%    fine = DDRefine(coarse,D,Filter,LEF,REF)
%  Inputs
%    coarse    1-d signal at a coarse scale: length(coarse)=n
%    D         D degree of polynomials used for interpolation
%    Filter    interpolating filter from MakeDDFilter(D)
%    LEF       Left Edge Boundary filter from MakeDDBdryFilter(D)
%    REF       Right Edge Boundary filter from MakeDDBdryFilter(D)
%  Outputs
%    fine      1-d signal at a fine scale: length(fine) = 2*n
%
%  Description
%    The Deslauriers-Dubuc Refinement scheme (symmetric
%    Lagrangian Interpolation of order D) is used to refine
%    data on a grid of n points to data on a grid of 2n points.
%    The odd samples 2*i-1 at the fine scale agree with samples i
%    at the coarse scale; the even samples 2*i are obtained by 
%    polynomial interpolation of the coarse samples near i.
%
%  See Also
%    DDDyadUp, DDDyadDown, FWT_DD, IWT_DD
%
	n = length(a); n2 = 2*n; a2 = zeros(1,n2);
%
%  Filtering, at Heart of Interval
%
	ae = [ a; 0 .*a ]; ae = ae(:)'; 
	temp = conv(Filter,ae);
	a2((D):(n2-D+1)) = temp((2*D):(n2+1));
%
%  Boundary-Correction
%
	if D > 1,
	  a2(1:(D-1)) = LEF * (a(1:(D+1))');
	  a2((n2-D+2):n2) = reverse(REF * (reverse(a((n-D):n))'));
	end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
