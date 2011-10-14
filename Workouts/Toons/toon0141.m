% toon0141 -- Illustrating Boundary Wavelets
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
% 2. Plot CDJV Boundary-Wavelets
%
	w(dyad2ix(4,0)) = 1;
	psi40 = IWT_CDJV(w,3,3);
	w(dyad2ix(4,0)) = 0;
%
	w(dyad2ix(4,1)) = 1;
	psi41 = IWT_CDJV(w,3,3);
	w(dyad2ix(4,1)) = 0;
%
	w(1) =1;
	phi40 = IWT_CDJV(w,4,3);
%
	w(1:2) =[0 1];
	phi41 = IWT_CDJV(w,4,3);
	w(2)=0;

%	clf;
	subplot(221); plot(t,psi40); title('Boundary Mother Wavelet, {4,0}; N=3'); axis([0 .25 -.25 .25])
	subplot(222); plot(t,psi41); title('Boundary Mother Wavelet, {4,1}; N=3'); axis([0 .25 -.25 .25])
	subplot(223); plot(t,phi40); title('Boundary Father Wavelet, {4,0}; N=3'); axis([0 .25 -.25 .25])
	subplot(224); plot(t,phi41); title('Boundary Father Wavelet, {4,1}; N=3'); axis([0 .25 -.25 .25])
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
