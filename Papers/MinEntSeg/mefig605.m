% mefig605 -- Residuals from Segmentation Pursuit, object "Bumps"
%
% Here we do ten iterations of segmentation pursuit on object Bumps.
% We show the successive residuals at the first ten stages.
%
% WARNING: unless you have the appropriate .MEX file installed,
% or are using a wickedly fast machine, this can take hours.
%
% Note: this depend on your having already run mefig604.
%
	global Bumps n ord history
%
    if isempty(history)
        warndlg('Please run fig 6.04 first');
        return
    end
    
    
	%clf;
	%subplot(111);
	LockAxes([0 1 -1 (11)])
%
    scal = .2;
	r = Bumps;
	for iter = 1:11,
	    plot(ord, scal .* r  + (iter-1));
	    if(iter < 11),
			df = history(iter,:);
	    	r = r-df;
		end
	end
	title('6.5 First Ten Residual Components Extracted by Pursuit')
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
