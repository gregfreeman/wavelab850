% scfig24 -- Short Course 24: Compare Segmented and Ordinary Refinement
%
% (Panel a) shows signal ``Ramp'' with a discontinuity, and the results of
% refining its coarse-scale averages by segmented MRA (Panel a) and 
% by ordinary MRA (Panel b).
%
% Segmented refinement **with correct choice of segmentation** reconstructs
% the fine-scale version of Ramp *perfectly* from the coarse-scale averages.
%
% Non-segmented refinement smooths out the discontinuity.
%
	afine = zeros(1,128);
	afine(1:37) = ((1:37) - .5)./37;
	afine(38:128) = ((38:128) - 38.5)./91;
	a2 = HCoarsen(afine,1);
	ac = HCoarsen(a2,1);
	E2 = MakeAIBdryFilter(2);
	F2 = MakeAIFilter(2);
	t = 37 ./128;
%
	r2 = SegRefine(ac,2,F2,E2,t,5);
	r4 = SegRefine(r2,2,F2,E2,t,6);
	o2 = AIRefine(ac,2,F2,E2);
	o4 = AIRefine(o2,2,F2,E2);
%
% 	clf;
	ax = [ 0 100 0 2];
	versaplot(211,[],afine,'.',' 24 (a) Segmented Multi-Resolution Analysis',ax,1);
	plot(r4); hold off;
	axis([ 0 100 0 2]);
	versaplot(212,[],o4,   '.',' 24 (b) Ordinary Multi-Resolution',ax,0)
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
