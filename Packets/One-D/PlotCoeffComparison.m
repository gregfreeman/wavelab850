function PlotCoeffComparison(wp,wp_stree,cp,cp_stree,titlestr)
% PlotCoeffComparison -- Compare coefficients in various bases
%  Usage
%    PlotCoeffComparison(wp,wp_stree,cp,cp_stree,titlestr)
%  Inputs
%    wp          Wavelet Packet table,
%    wp_stree    Wavelet Packet Stat tree
%    cp          Cosine Packet table
%    cp_stree    Cosine Packet Stat tree
%    titlestr    title for plot
%
%  Description
%    Make plots to compare the signal representations via
%    both Cosine Packets and Wavelet packets. 
% 
%  Side Effects
%    For both Wavelet Packets and Cosine Packets:
%       coeff plot, best level
%       sorted coeff plot, best basis
%       printout, entropies best level, best basis
%
	if nargin < 5,
	   titlestr = ' ';
	end
%
	subplot(211);
	LockAxes([0 1 0 7]); 
%
	[n,L] = size(wp); D = L-1;
	t = (.5:(n-.5))./n);
	bestwplevel = CompareStdBases(wp_stree,D);
	coefwplevel = wp(:,bestwplevel)';
	coefwplevel = coefwplevel ./max(abs(coefwplevel));
	PlotSpikes(1,t,coefwplevel);
	coefwplevel = reverse(sort(abs(coefwplevel))) ;
%
	wtree = zeros(1,2^L);
	for d=0:(D-1)
	    wtree(node(d,0)) = 1;
	end
%
	coefwpwave = UnpackBasisCoeff(wtree,wp);
	coefwpwave = coefwpwave ./max(abs(coefwpwave));
	PlotSpikes(2,t, coefwpwave);
	coefwpwave = reverse(sort(abs(coefwpwave)));
%
	btreewp    = BestBasis(wp_stree,D);
	coefwpbest = UnpackBasisCoeff(btreewp,wp);
	coefwpbest = coefwpbest ./max(abs(coefwpbest));
	PlotSpikes(3,t,coefwpbest);
	coefwpbest = reverse(sort(abs(coefwpbest)));
%
	[n,L] = size(cp); D=L-1;
	bestcplevel = CompareStdBases(cp_stree,D);
	coefcplevel = cp(:,bestcplevel)';
	coefcplevel = coefcplevel ./max(abs(coefcplevel));
	PlotSpikes(4,t,coefcplevel);
	coefcplevel = reverse(sort(abs(coefcplevel)));
%
	coefcpfour = cp(:,1)';
	coefcpfour = coefcpfour ./max(abs(coefcpfour));
	PlotSpikes(5,t,coefcpfour);
	coefcpfour = reverse(sort(abs(coefcpfour)));
%
	btreecp    = BestBasis(cp_stree,D);
	coefcpbest = UnpackBasisCoeff(btreecp,cp);
	coefcpbest = coefcpbest ./max(abs(coefcpbest));
	PlotSpikes(6,t,coefcpbest);
	coefcpbest = reverse(sort(abs(coefcpbest)));
%
	title(['Basis Comparison for signal ' titlestr]);
	ylabel('Basis'); xlabel('Coeff Index');
	UnlockAxes;
% setup second plot
	subplot(212);
	LockAxes([0 1 0 7]); 
%
	PlotSpikes(1,t,(coefwplevel)); text(.91,1.25,'Best WP Level')
	PlotSpikes(2,t,(coefwpwave));  text(.91,2.25,'Wavelet')
	PlotSpikes(3,t,(coefwpbest));  text(.91,3.25,'Best WP')
	PlotSpikes(4,t,(coefcplevel)); text(.91,4.25,'Best CP Level')
	PlotSpikes(5,t,(coefcpfour));  text(.91,5.25,'Cosine')
	PlotSpikes(6,t,(coefcpbest));  text(.91,6.25,'Best CP')
	title(['Sorted Coeff Comparison for signal ' titlestr]);
	ylabel('Basis'); xlabel('Coeff Order');
	UnlockAxes;

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
