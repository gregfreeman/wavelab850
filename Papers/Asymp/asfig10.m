% asfig10 -- Asymptopia Figure 10: Compare various thresholds; ESCA data
%
% Here we illustrate the application of wavelet thresholding to Poisson
% Counts data.  An ESCA spectrum with millions of counts is used as
% a ``true'' object, and an empirical spectrum with maximum 4000 counts/bin
% is simulated from it. This simulated spectrum is transformed by the Anscombe
% variance-stabilizing transformation for poisson data, which are
% then processed as in the white noise model.
%
% The point here is to compare several different thresholding rules
% to give an idea how soft, hard, minimax and adaptive thresholding
% might differ.
%
    esca = ReadSignal('ESCA');
    intens = 4000 .* esca ./ max(max(esca));
	if exist('ESCAsim.mat'),
		disp('File ESCAsim.mat exists -- loading')
		load ESCAsim   % faster than simulating
	else
		disp('File ESCAsim.mat ~exist -- calculating')
		disp('This could take a while')
		counts = fishrand(intens,10);  % poisson variate generator
	end

    y = 2.*sqrt(counts + .375);
    t = 1:length(counts);
%
	[nn,J] = dyadlength(y) ; L =4;
	rwc = FWT_CDJV(y,L,3) ; swc = rwc; hwc = rwc; suwc = rwc;
%
	suwc = MultiSURE(suwc',L);
	swc((2^(L)+1):nn) = SoftThresh(swc((2^(L)+1):nn),sqrt(2*log(nn))) ;
	hwc((2^(L)+1):nn) = HardThresh(hwc((2^(L)+1):nn),sqrt(2*log(nn))) ;

%
	surerecon    = IWT_CDJV(suwc,L,3);
	softrecon    = IWT_CDJV( swc,L,3);
	hardrecon    = IWT_CDJV (hwc,L,3);

%
	%clf;
    ax  = [400 900 50 140];
	versaplot(512,t,y,[],        '10 (b) Rooted Count',ax,[])
	versaplot(513,t,surerecon,[],'10 (c) SURE Shrink' ,ax,[])
	versaplot(515,t,softrecon,[],'10 (d) Soft Thresh' ,ax,[])
	versaplot(514,t,hardrecon,[],'10 (e) Hard Thresh' ,ax,[])
	versaplot(511,t,2*sqrt(intens),[],'10 (a) Root Intensity',ax,[])
%  
% Prepared for the paper Wavelet Shrinkage: Asymptopia?
% Copyright (c) 1994 David L. Donoho and Iain M. Johnstone
%  
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
