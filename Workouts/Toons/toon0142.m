% toon0142 -- Illustrating Boundary Wavelets
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
% 3. Plot Periodized Boundary-Wavelets
%
	QMF_Filter = MakeONFilter('Daubechies',6);
	w(dyad2ix(4,15)) = 1;
	psi415 = IWT_PO(w,3,QMF_Filter);
	w(dyad2ix(4,15)) = 0;
%
	w(dyad2ix(4,14)) = 1;
	psi414 = IWT_PO(w,3,QMF_Filter);
	w(dyad2ix(4,14)) = 0;
%
	w(16) =1;
	phi415 = IWT_PO(w,4,QMF_Filter);
%
	w(15:16) =[1 0];
	phi414 = IWT_PO(w,4,QMF_Filter);
	w(15)=0;
%	clf;
	subplot(221); plot(t,psi415); title('Periodized Mother Wavelet {4,15}; N=3');  axis([0 1 -.25 .25])
	subplot(222); plot(t,psi414); title('Periodized Mother Wavelet {4,14}; N=3');  axis([0 1 -.25 .25])
	subplot(223); plot(t,phi415); title('Periodized Father Wavelet {4,15}; N=3');  axis([0 1 -.25 .25])
	subplot(224); plot(t,phi414); title('Periodized Father Wavelet {4,14}; N=3');  axis([0 1 -.25 .25])
    

%  Revision History
%             10/1/05     AM     Changing the name of the variable QMF

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
