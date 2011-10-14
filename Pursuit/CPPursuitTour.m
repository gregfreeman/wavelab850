function [atomic,resid] = CPPursuitTour(Format,x,D,bell,natom,titlestr)
% CPPursuitTour -- Cosine Packet atomic decomposition
%  Usage
%    [cp, btree] = CPPursuitTour(Format,x,D,ball [,natom,title])
%  Inputs  
%    Format   string: 'S' for sequential display of four figures
%                     'P' for four-panel display  
%    x        1-d signal to analyze by Wavelet Packets
%    D        fineness of time domain splitting
%    bell     bellname (e.g. 'Sine')
%    natom    maximum number of atoms to extract by Matching Pursuit
%    title    name of signal
%  Outputs 
%    atomic   atom list,  cosine packet dictionary (see CPPursuit)
%    resid    residual
%
%  Description
%    The format string controls whether all four displays
%    are drawn as subplots in one figure, or whether they are 
%    drawn one-after-the-other on the same figure
%
%    The global PREFERIMAGEGRAPHICS controls whether the phase
%    portrait is done using ``image'' graphics (if =1) or ``plot''
%    graphics (if =0).
%
%  Side Effects
%    plot of Cosine Packet Synthesis Table
%    plot of Cosine Packet Residuals Table
%    plot of Compression Numbers
%    plot of phase plane
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
	[atomic,resid] = CPPursuit(x,D,bell,natom,.001,0);
%
	if strcmp(Format(1),'P'),
		subplot(221)
	end
%
	signaltitle = [ 'MP; CP Dict.; ' titlestr];
	PlotSynthesisTable('CP',atomic,n,D,0.,signaltitle);
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
	cp = CPAnalysis(resid,D,bell);
	PlotPacketTable(cp);
	signaltitle = [ 'MP Residuals ; CP Dict.; ' titlestr];
	title(signaltitle); ylabel('Split Level'); xlabel('Time[Frequency]')
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
	     ImageAtomicPhase('CP',atomic,n,titlestr)
	else 
	      PlotAtomicPhase('CP',atomic,n,titlestr)
	end
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
	end
%
% Copyright (c) 1993-1994. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
