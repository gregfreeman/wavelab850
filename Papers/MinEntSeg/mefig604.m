% mefig604 -- Segmentation Pursuit, object "Bumps"
%
% Here we do ten iterations of segmentation pursuit on object Bumps.
% We show the terms extracted at the first ten stages.
%
% WARNING: unless you have the appropriate .MEX file installed,
% or are using a wickedly fast machine, this can take hours.
%
	global Bumps n ord
	global history
%
    n = 2048;
	[Bumps,ord,pos] = MakeMESTestSig('Bumps',n);
%
    
    currentfig=gcf;
%
%	if isempty(history), 
		Seg_Pursuit;
%	end
%
	%clf;
	%subplot(111);
    figure(currentfig);
	scal = .2;
	LockAxes([0 1 0 (11)])
	for iter = 1:10,
	    df = history(iter,:);
	    plot(ord, scal .* df  + iter);
	end
	title('6.4 First Ten Segmentation-Components Extracted by Pursuit')
	UnlockAxes;

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
