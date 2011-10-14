% mefig603 -- Segmentation Components of object "Bumps"
%
% Here we display the segmentation components, as
% defined in the text, for object Bumps.  These are
% obtained by segmenting the transform at each of the
% peaks in turn, identifying those components that
% are affected by the segmentation, and inverting those
% components.
%
% WARNING: unless you have the appropriate .MEX file installed,
% or are using a wickedly fast machine, this can take hours.
%
	global Bumps n ord pos
	global wc1 sg 
%
    n = 2048;                                    %AM 10/05
	[Bumps,ord,pos] = MakeMESTestSig('Bumps',n); %AM 10/05
%
	D=2; 
	F2 = MakeAIFilter(D);
	E2 = MakeAIBdryFilter(D);
	[R2,P2] = MakeAIRightFilter(D);
	L=4;
	scal =.2;
%
	if isempty(Bumps),
	  MakeBumps
	end
	if isempty(wc1)
	  wc1 = FWT_AI(Bumps,L,D,F2,E2);
	end
	if isempty(sg)    
	   sg = FastAllSeg(Bumps,L,D,R2)';  % be sure and erase sg after use
	end
%
	%clf;
	%subplot(111);
	LockAxes([0 1 0 (length(pos)+1)])
	for k_peak = 1:length(pos),
	    t  = pos(k_peak);
	    df = SharpPart(wc1,sg,L,D,F2,E2,t);
	    plot(ord, scal .* df  + k_peak);
	end
	title('6.3 Segmentation-Components of Object Bumps')
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
