function [atomic,resid] = WPMPursuitTour(x,D,qmf,natom,titlestr)
% WPMPursuitTour -- Wavelet Packet atomic decomposition
%  Usage
%    [wp, btree] = WPMPursuitTour(Format,x,D,qmf [,maxits,title])
%  Inputs  
%    x       1-d signal to analyze by Wavelet Packets
%    D       fineness of frequency splitting
%    qmf     quadrature mirror filter (e.g. Coiflet c3)
%    natom   maximum number of atoms to extract by Matching Pursuit
%    title   name of signal
%  Outputs 
%    atomic  atoms list, wavelet packet dictionary (see WPPursuit)
%    resid   residual
%
%
%  See Also
%    WPAnalysis, BestBasis, PlotPhasePlane, PlotBasisTree
%

	n = length(x);
	[atomic,resid] = WPPursuit(x,D,qmf,natom,.001,0);

	signaltitle = [ 'MP; WP Dict.; ' titlestr];
	PlotSynthesisTable('WP',atomic,n,D,0.,signaltitle);
%
	wp = WPAnalysis(resid,D,qmf);
	PlotPacketTable(wp);
	signaltitle = [ 'MP Residuals ; WP Dict.; ' titlestr];
	title(signaltitle); ylabel('Split Level'); xlabel('Frequency[Time]')
%
	energy = sum(x.^2);
	compressnumbers = [energy ; (energy - cumsum(atomic(:,1).^2))];
	plot(log(compressnumbers));
	xlabel('m'); ylabel('log(c_m)'); title('Compression Numbers')

	PlotAtomicPhase('WP',atomic,n,titlestr)

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
