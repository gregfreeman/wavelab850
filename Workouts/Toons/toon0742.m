% toon0742 -- Visualize wavelet packet decomposition of SlowChirp
%
	n = 1024;
	t = (1:n)./n;
	MAXPLOTS = 25;
	xi  		= pi/5 .* t;
	SlowChirp   = cos(xi .* (1:n));
	qmf = MakeONFilter('Symmlet',8);
	D   = 10;
%
	wp  = WPAnalysis(SlowChirp,D,qmf);
	st  = CalcStatTree(wp,'Entropy');
	bb  = BestBasis(st,D);
	cf  = UnpackBasisCoeff(bb,wp);
	wc  = cf ./norm(cf);
	count = min([sum(abs(wc) > 1.e-2) MAXPLOTS]);
clf;
%subplot(221); plot(t,SlowChirp); title('SlowChirp');
%subplot(223); PlotPacketTable(wp); title('WP[SlowChirp]');
%ylabel('split level'); xlabel('Frequency[Time]')
%
	subplot(121);
	LockAxes([0 1 0 MAXPLOTS+1]);
	title('First 25 WP Components of SlowChirp');
	subplot(122);
	LockAxes([0 1 MAXPLOTS 2*MAXPLOTS+1]);
	title('Next 25 WP Components of SlowChirp');
%
	cwp  = zeros(size(wp));
	cwp = PackBasisCoeff(bb,cwp,cf);
	nplot = 0;
	subplot(121);
	for kk=1:50,
	   if kk == 26,
	      drawnow;
	      subplot(122);
	   end
	   [amp,ind] = max(abs(cwp(:)));
	   [d,b,k] = ix2pkt(ind,D,n);
	   dwp     = WPImpulse(cwp,d,b,k,qmf);
	   wcmp    = dwp(:,1)';
	   nplot = nplot+1;
	   plot(t,nplot + cwp(ind).*wcmp);
	   txt = sprintf('(%1.0f,%2.0f,%2.0f)',d,b,k);
	   text(.87,nplot+.275,txt);
	   cwp(ind) = 0;
	end
%
	drawnow;
	subplot(121); UnlockAxes;
	subplot(122); UnlockAxes;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
