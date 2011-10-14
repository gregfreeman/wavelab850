% toon0842 -- Visualize cosine packet decomposition of SlowChirp
%
% construct SlowChirp
%
	n = 1024;
	t = (1:n)./n;
	MAXPLOTS = 25;
	xi  		= pi/5 .* t;
	SlowChirp   = cos(xi .* (1:n));
	D   = 6;
%
	cp  = CPAnalysis(SlowChirp,D,'Sine');
	st  = CalcStatTree(cp,'Entropy');
	bb  = BestBasis(st,D);
	cf  = UnpackBasisCoeff(bb,cp);
	wc  = cf ./norm(cf);
	count = min([sum(abs(wc) > 1.e-2) MAXPLOTS]);
	clf;
%subplot(221); plot(t,SlowChirp); title('Function SlowChirp');
%subplot(223); PlotPacketTable(cp); title('CP[SlowChirp]');
%ylabel('split level'); xlabel('Time[Frequency]')
%
	subplot(121);
	LockAxes([0 1 0 MAXPLOTS+1]);
	title('First 25 CP Components of SlowChirp');
	subplot(122);
	LockAxes([0 1 MAXPLOTS 2*MAXPLOTS+1]);
	title('Next 25 CP Components of SlowChirp');
%
	ccp  = zeros(size(cp));
	ccp  = PackBasisCoeff(bb,ccp,cf);
	nplot = 0;
	subplot(121);
	for kk=1:50,
	   if kk == 26,
	      drawnow;
	      subplot(122);
	   end
	   [amp,ind] = max(abs(ccp(:)));
	   [d,b,k] = ix2pkt(ind,D,n);
	   dcp     = CPImpulse(ccp,d,b,k,'Sine');
	   ccmp    = dct_iv(dcp(:,1)');
	   nplot = nplot+1;
	   plot(t,nplot + ccp(ind).*ccmp);
	   txt = sprintf('(%1.0f,%2.0f,%2.0f)',d,b,k);
	   text(.87,nplot+.275,txt);
	   ccp(ind) = 0;
	end
	drawnow;
	subplot(121); UnlockAxes;
	subplot(122); UnlockAxes;
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
