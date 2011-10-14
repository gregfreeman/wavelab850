% mefig305 -- Entropy Profiles, Object "Cusp"
%
% Here we display the entropy of the segmented wavelet transform
% as a function of point of segmentation.  The object being analyzed,
% "Cusp", has a discontinuity of slope at point tau = 378/n.  
%
% Several choices of entropy are considered. They all have minima
% near tau.  Note that the minima are much less pronounced than in
% figure 3.3.  This is because it is much harder to detect a discontinuity
% in slope than in level.
%
% Note: this script uses object `ent' computed by mefig304
%

	global id ent
    if isempty(ent)
        warndlg(' Please run figure 3.04 first and then run this figure ');
        return
    end
    
%
	subplot(221)
	plot((id-8):(id+7),ent(1,:))
	title('3.5 Entropies for Object Cusp^4, t=k/n ')
	xlabel('k')
	ylabel('L^{1/2}(k)')
%
	subplot(222)
	plot((id-8):(id+7),ent(2,:))
%	title('3.5b Sparsity Measure, L^{1}, t=k/n')
	xlabel('k')
	ylabel('L^1(k)')
%
	subplot(223)
	plot((id-8):(id+7),ent(3,:))
%	title('3.5c Sparsity Measure, L^2 log(L^2), t=k/n')
	xlabel('k')
	ylabel('{L^2 log(L^2)}(k)')
%
	subplot(224)
	plot((id-8):(id+7),ent(4,:))
%	title('3.5d Sparsity Measure, L^2, t=k/n')
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
