function ECoeff = FastAllSeg(sig,L,D,R2)
% FastAllSeg -- Fast All-Segmentations algorithm
%  Usage
%    ECoeff = FastAllSeg(sig,L,D,R2);
%  Inputs
%    sig	signal to be analyzed. dyadic length.
%    L      coarsest resolution level
%    D      degree of interpolation
%    R2     unused
%  Outputs
%    ECoeff multi-resolution edge detector filter output 
%
%  Description
%    Implements algorithm described in Donoho, "On Minimum
%    Entropy Segmentation" to compute all results of all
%    pixel-level segmentations.
%
if( D ~= 2),
    ' I only know how to do D=2 '
else
	[R2,P2] = MakeAIRightFilter(D);
	fine    = sig; 
	[n,J]   = dyadlength(sig);
	m       = J-L;
	toggle  = 1;
	profile = zeros(1,n);
	ECoeff  = zeros(m*3,n);
	for lev = 1:m,
	    n2       = length(fine);
	    leftsub  = fine(1:2:n2-1); 
	    rightsub = fine(2:2:n2);
	    coarse   = (leftsub + rightsub) /2;
	    r1refine = off_filter(coarse,reverse(R2(1,:)),3);
	    r2refine = off_filter(coarse,reverse(R2(2,:)),3);
	    l1refine = off_filter(coarse,       (R2(1,:)),-1);
	    l2refine = off_filter(coarse,       (R2(2,:)),-1);

        r1res    = (lshift(leftsub) - r1refine);
	    r2res    = (lshift(rightsub)- r2refine);
	    l1res    = (rshift(rightsub) - l1refine);
	    l2res    = (rshift(leftsub)- l2refine);
	    ECoeff((lev-1)*3 + 3,:) = expand(r2res,n) .*sqrt(2);
	    ECoeff((lev-1)*3 + 1,:) = expand(l1res,n) .*sqrt(2);
	    profile = profile + abs(expand(r2res,n)) + abs(expand(l2res,n)); 
	    clrefine = zeros(1,n);
	    crrefine = zeros(1,n);
	    clres    = zeros(1,n);
	    crres    = zeros(1,n);
	    n1 = n2/2;
	    klow = n*((D+1)/n1);
	    for k=klow:(n-klow-1)
	        segpt         = k/n;
	        k0            = floor(segpt*n1);
	        eta           = n1*segpt-k0;
	        SegFilt       = MakeAISegFilter(D,eta);
	        out           = SegFilt * (coarse((1+k0-D-1):(1+k0+D+1))');
	        clrefine(k+1) = out(1);
	        crrefine(k+1) = out(2);
	        clres(k+1)    = (leftsub(1+k0) - clrefine(k+1));
	        crres(k+1)    = (rightsub(1+k0)- crrefine(k+1));
	    end
	    ECoeff((lev-1)*3 + 2,:) = crres .*sqrt(2);
	    profile = profile + abs(crres);
	    fine = sqrt(2) .* coarse;
	end
end


    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
