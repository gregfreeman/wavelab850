function [atomic,resid] = WPPursuitTour(Format,x,D,qmf,natom,titlestr)
% WPPursuitTour -- Wavelet Packet atomic decomposition
%  Usage
%    [wp, btree] = WPPursuitTour(Format,x,D,qmf [,maxits,title])
%  Inputs  
%    Format  string: 'S' for sequential display of four figures
%                    'P' for four-panel display  
%    x       1-d signal to analyze by Wavelet Packets
%    D       fineness of frequency splitting
%    qmf     quadrature mirror filter (e.g. Coiflet c3)
%    natom   maximum number of atoms to extract by Matching Pursuit
%    title   name of signal
%  Outputs 
%    atomic  atoms list, wavelet packet dictionary (see WPPursuit)
%    resid   residual
%
%  Side Effects
%    plot of Wavelet Packet Synthesis Table
%    plot of Wavelet Packet Residuals Table
%    plot of Compression Numbers
%    plot of phase plane
%
%  Description
%    The format string controls whether all four displays
%    are drawn as subplots in one figure, or whether they are 
%    drawn one-after-the-other on the same figure.
%
%    The global PREFERIMAGEGRAPHICS controls whether the phase
%    portrait is done using ``image'' graphics (if =1) or ``plot''
%    graphics (if =0).
%
%  See Also
%    WPAnalysis, BestBasis, PlotPhasePlane, PlotBasisTree
%

	global PREFERIMAGEGRAPHICS
	if ~exist('PREFERIMAGEGRAPHICS'),
	   PREFERIMAGEGRAPHICS = 0;
	end
%
	n = length(x);
	[atomic,resid] = WPPursuit(x,D,qmf,natom,.001,0);
%
	if strcmp(Format(1),'P'),
		subplot(221)
	end
%
	signaltitle = [ 'MP; WP Dict.; ' titlestr];
	PlotSynthesisTable('WP',atomic,n,D,0.,signaltitle);
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
	end
%
%
	if strcmp(Format(1),'P'),
		subplot(222)
	end
%
	wp = WPAnalysis(resid,D,qmf);
	PlotPacketTable(wp);
	signaltitle = [ 'MP Residuals ; WP Dict.; ' titlestr];
	title(signaltitle); ylabel('Split Level'); xlabel('Frequency[Time]')
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
	end
%
	if strcmp(Format(1),'P'),
	    subplot(223)
	end
%
	energy = sum(x.^2);
	compressnumbers = [energy ; (energy - cumsum(atomic(:,1).^2))];
	plot(log(compressnumbers));
	xlabel('m'); ylabel('log(c_m)'); title('Compression Numbers')
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
	end
%
	if strcmp(Format(1),'P'),
	    subplot(224)
	end
%
	if PREFERIMAGEGRAPHICS,
	     ImageAtomicPhase('WP',atomic,n,titlestr,256,qmf)
	else 
	      PlotAtomicPhase('WP',atomic,n,titlestr)
	end
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
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
