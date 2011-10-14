% scfig19 -- Short Course 19: Display Vaguelette Kernels
%
% (Panels a-c) display three mother vaguelettes used in inversion
% of the Radon transform. The integral of sine-o-gram data
% against these vaguelettes will result in estimates of wavelet
% coefficients at scale-location (0,0) and orientation {Horizontal,
% Vertical, Diagonal}. (Panel d) shows one vaguelette having 
% undergone twisted dilation, so that it measures the wavelet 
% coefficient at scale 2^{-3} and location (kx=4,ky=2)
%
	load Figure19
%
% 	clf;  
    view = [-37.5 45];
	subplot(221); mesh(pfm,view);  title('19 (a) Gamma(0,0,Vert)')
	subplot(222); mesh(pmf,view);  title('19 (b) Gamma(0,0,Horiz)')
	subplot(223); mesh(pmm,view);  title('19 (c) Gamma(0,0,Diag)')
	subplot(224); mesh(real(pgen),view); title('19 (d) Gamma(j=3,(kx=4,ky=2),Diag)')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
