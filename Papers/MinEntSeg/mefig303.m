% mefig303 -- Entropy Profiles, Object "Ramp"
%
% Here we display the entropy of the segmented wavelet transform
% as a function of point of segmentation.  The object being analyzed,
% "Ramp", has a discontinuity at point tau = 378/n.  
%
% Several choices of entropy are considered. They all have minima
% at the tau.
%
% Note: this script uses object `ent' computed by mefig302
%
	global ent
	global id
%
	subplot(221)
	plot((id-8):(id+7),ent(1,:))
	title('3.3a Entropies for Ramp Object, t=k/n')
	xlabel('k')
	ylabel('L^{1/2}(k)')
%
	subplot(222)
	plot((id-8):(id+7),ent(2,:))
	%title('3.3b L^{1} Entropy')
	xlabel('k')
	ylabel('L^1(k)')
%
	subplot(223)
	plot((id-8):(id+7),ent(3,:))
	%title('3.3c L^2 log(L^2) Entropy')
	xlabel('k')
	ylabel('{L^2 log(L^2)}(k)')
%
	subplot(224)
	plot((id-8):(id+7),ent(4,:))
	%title('3.3d L^2 Entropy')
	xlabel('k')
	ylabel('{L^2}(k)')
%  
% Prepared for the paper Minimum Entropy Segmentation 
% Copyright (c) 1994 David L. Donoho
%  
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
