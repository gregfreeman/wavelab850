% vdlfig09 -- Minimum Entropy Focusing: Evaluate minimum
%
% Here we experiment with using the wavelet transform to focus a blurry
% signal (i.e. one convolved with an autoregressive filter).  By assigning
% a cost-functional to the fine-scale wavelet coefficients, we may evaluate
% this entropy over choices of the deblurring parameter and deblur by choosing
% the parameter corresponding to the minimum entropy.
%

global ent_min;

	rho = .9;
	qmf = MakeONFilter('Haar');
%
	x = MakeSignal('Blocks',512);
	y = filter(1,[1 ((-2 * rho)) (rho^2)],x);
%
	ngrid = 21;
	tau_grid = linspace(-1,1,ngrid);
	for i=1:ngrid,
		tau = tau_grid(i);
		by = filter([1 ((-2 * tau)) (tau^2)],1,y);
	%
		nrm_by = norm(by);
	%
		wby = FWT_PO(by,3,qmf); wby = wby(9:512);
		ent(i) = norm(wby,1)  ;
	end
%
	plot(tau_grid,ent)
	title('Figure 9: Entropy Profile')
	xlabel('tau, Filter Parameter')
	ylabel('Normalized Entropy')
%
    [ent_min,imin] = min(ent);
    [ent_max,imax] = max(ent);
	tau_min = tau_grid(imin);
	hold on; plot([tau_min tau_min], [ent_min ent_max], '-.'); hold off
	axis([0 1 0 10^4])

% 
% Copyright (c) 1995, Jonathan Buckheit and David Donoho.
% Prepared for ``WaveLab and Reproducible Research''
% for XV Recontres Franco-Belges symposium proceedings.
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
