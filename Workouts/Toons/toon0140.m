% toon0140 -- Illustrating Boundary Wavelets
%
%  On a finite interval, one has also to make a choice about the
%  boundary behavior.  The two choices:
%
%  1. Periodization. The wavelets that encounter the boundary, 
%     simply wrap around, as if the interval were a circle.
%
%  2. Boundary-Adjustment. The wavelets located near the boundary
%     are deformed versions of the wavelets at the interior.
%
%  Here we display wavelets at the interior of an interval, and
%  the two different behaviors the same wavelets can show at the boundary.
%
	w = zeros(1,1024);
	t = (0:1023) ./1024;
%
% 1. Plot Daubechies Father & Mother Wavelets
%
	w(dyad2ix(4,8)) = 1;
	psi48 = IWT_CDJV(w,3,3);

	w(dyad2ix(4,8)) = 0;
	w(9) = 1;
	phi48 = IWT_CDJV(w,4,3);
	w(9) = 0;

	clf;  
	subplot(211); plot(t,psi48); title('Mother Wavelet at center {4,8}; N=3'); axis([.25 .75 -.25 .25])
	subplot(212); plot(t,phi48); title('Father Wavelet at center {4,8}; N=3'); axis([.25 .75 -.25 .25])
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
