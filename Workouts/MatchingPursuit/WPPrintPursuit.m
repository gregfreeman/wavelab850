function [atomic,res] = WPPrintPursuit(x,D,qmf,natom,frac,printlist)
% WPPrintPursuit -- Print Intermediate Results, MP with Wavelet Packets
%  Usage
%    atomic = WPPrintPursuit(x,D,qmf,natom,frac,show)
%  Inputs
%    x        signal of dyadic length to be decomposed
%    natom    max # of atoms desired
%    frac     min fraction total signal energy to enter
%    D,qmf    usual Wavelet Packets parameters
%	 prnt	  list of iteration numbers (multiples of 5)
%             at which to print a PostScript file
%  Outputs
%    atomic    parameters of atomic decomposition
%
%  References
%    S. Mallat and S. Zhang, Matching Pursuits with
%       Time-Frequency Dictionaries
%
%  See Also
%    WPPursuit, WPSynthesis
%
	n = length(x); nrm = norm(x);
	wp = WPAnalysis(x,D,qmf);
	atomic = zeros(natom,4);
	res = ShapeAsRow(x); amax = max(abs(res)); t = (.5:(n-.5))./n;
	nuc = 0;
	amp = nrm;
	nplot = 0;
%
	show =1;
%

	while(nuc < natom & amp > frac*nrm),
	
		 [amp,ind] = max(abs(wp(:)));
		 [d,b,k] = ix2pkt(ind,D,n);
		 a = wp(pkt2ix(d,b,k,D,n),d+1);
		 
		 fprintf('WPPrintPursuit step %3.0f :',nuc); disp([ a d b k ])
	
		 dwp = WPImpulse(wp,d,b,k,qmf);
		 wp = wp - a*dwp;     
	
		 if amp==0, break, end
		 
		 if rem(nuc,5) == 0,
		 	if find(nuc == printlist),
				file = sprintf('wp_fig%i.ps',nuc);
				ifprint(gcf,file);
			end
		 end

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
