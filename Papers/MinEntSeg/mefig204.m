% mefig204 -- Compare Ordinary AI & Segmented AI Refinements
%
% This plot illustrates that segmented refinement, with an
% ideally-chosen refinement point, outperforms ordinary refinement,
% when the underlying object is discontinuous.
%
% Ordinary Refinement just smears out the discontinuity.
%
%
	E2 = MakeAIBdryFilter(2);
	F2 = MakeAIFilter(2);
%
	nn=256; J=8;
	[RRamp,xx,iid] = MakeMESTestSig('Ramp',nn);
	tt = iid /nn;
%
	%clf; 
%
	subplot(221); 
	LockAxes([ .3 .5 -.5 1.5]);
	bloxplot(xx,RRamp ,'2.4a (Original)  Ramp ');
%
	subplot(222); 
	LockAxes([ .3 .5 -.5 1.5]);
	xc = (1:(nn/4))./(nn/4);
	a2    = HCoarsen(RRamp,1);
	CRamp = HCoarsen(a2,1);
	bloxplot(xc,CRamp,'2.4b (Coarsened) Ramp ')
%
	subplot(223); 
	LockAxes([ .3 .5 -.5 1.5]);
	sr2 = SegRefine(CRamp,2,F2,E2,tt,J-2);
	sr4 = SegRefine(sr2,2,F2,E2,tt,J-1);
	bloxplot(xx,sr4  ,'2.4c Segmented Refinement')
%
	subplot(224); 
	LockAxes([ .3 .5 -.5 1.5]);
	r2 = AIRefine(CRamp,2,F2,E2);
	r4 = AIRefine(r2,2,F2,E2);
	bloxplot(xx,r4   ,'2.4d Ordinary Refinement '); 

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
