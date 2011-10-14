function [atomic,res] = WPPursuit(x,D,qmf,natom,frac,show)
% WPPursuit -- Atomic Decomposition into Wavelet Packets by Matching Pursuit
%  Usage
%    atomic = WPPursuit(x,D,qmf,natom,frac,show)
%  Inputs
%    x        signal of dyadic length to be decomposed
%    natom    max # of atoms desired
%    frac     min fraction total signal energy to enter
%    D,qmf    usual Wavelet Packets parameters
%  Outputs
%    atomic    parameters of atomic decomposition
%
%  See Also
%    PlotAtomicPhase, WPSynthesis
%
%  References
%    S. Mallat and S. Zhang, ``Matching Pursuits with Time-Frequency
%    Dictionaries,'' IEEE Trans. Signal Proc., 41(12), pp. 3397-3415, 1993.
%
        global WLVERBOSE
	n = length(x); nrm = norm(x);
	wp = WPAnalysis(x,D,qmf);
	atomic = zeros(natom,4);
	res = ShapeAsRow(x); amax = max(abs(res)); t = (.5:(n-.5))./n;
	nuc = 0;
	amp = nrm;
	nplot = 0;
%
	while(nuc < natom & amp > frac*nrm),
	
		 [amp,ind] = max(abs(wp(:)));
		 [d,b,k] = ix2pkt(ind,D,n);
		 a = wp(pkt2ix(d,b,k,D,n),d+1);
		 if strcmp(WLVERBOSE,'Yes') 		 
		   fprintf('WPPursuit step %3.0f :',nuc); disp([ a d b k ])
		 end
	
		 dwp = WPImpulse(wp,d,b,k,qmf);
		 wp = wp - a*dwp;     
	
		 if amp==0, break, end
		 if show,
		   res = MonitorPursuit('WP',nuc,t,amax,res,a,dwp,D,qmf);
		 end
	
		 nuc = nuc + 1;
		 atomic(nuc,:) = [a d b k];
	end
    if ~show,
		res = wp(:,1)';
	end

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
