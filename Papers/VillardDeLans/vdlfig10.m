% vdlfig10 -- Minimum Entropy Focusing: Reconstruct blurry signal
%
% By using the deblurring scheme proposed, we get a perfect reconstruction
% of the blocks!  Admittedly the Haar wavelets are tuned for this example,
% or perhaps vice-versa.
%

global ent_min tau_min y x
if isempty(ent_min)
        warndlg ('Please run figure 9 first and then run this figure');
    return;
end
    

	by = filter([1 ((-2 * tau_min)) (tau_min^2)],1,y);
% 	clf;
	subplot(3,1,1); plot(x); title('Figure 10(a): Blocks')
	subplot(3,1,2); plot(y); title('Figure 10(b); Blurred Blocks')
	subplot(3,1,3);	plot(by);
	titlestr = sprintf('Figure 10(c); Minimum Entropy Deconvolution, Entropy = %g',ent_min);
    title(titlestr)

% 
% Copyright (c) 1995, David Donoho.
% Prepared for ``WaveLab and Reproducible Research''
% for XV Recontres Franco-Belges symposium proceedings.
%

%	Revision History
%		MRD 09/29/99	declared tau_min global	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
