% cspinf14 -- CycleSpinning CP De-Noising
%
%
global t N D
global QuadChirp MishMash n
global xQuad yQuad
global xMish yMish
%
    D=7;        %AM 10/05
	[xhQuad]  = zeros(size(yQuad));
	[xhMish]  = zeros(size(yMish));
%
	nxQuad    = 0;
	nxMish    = 0;
	FirstOnly = 1;
%
	nspin =16;
	for i=0:(nspin-1),		
		[chQuad]   = cyclespin(yQuad,  i);
		[chMish]   = cyclespin(yMish,  i);
%
		[dhQuad]   = CPDeNoise(chQuad,D,'Sine');
		[dhMish]   = CPDeNoise(chMish,D,'Sine');
%
		[dhQuad]   = cyclespin(dhQuad,  -i);
		[dhMish]   = cyclespin(dhMish,  -i);
%
		[xhQuad]   = xhQuad   + dhQuad;
		[xhMish]   = xhMish   + dhMish;
%
		if i==0,
			[zQuad]  = dhQuad;
			[zMish]  = dhMish;
		end
%
		if i==0 | (i > 0 & ~FirstOnly),
			nxQuad = nxQuad  + norm(dhQuad-xQuad).^2;
			nxMish  = nxMish + norm(dhMish-xMish).^2;
		end
%
	end
%
	[xhQuad]   = xhQuad/nspin;
	[xhMish]   = xhMish/nspin;
%
	if FirstOnly, denom=1; else, denom=nspin; end
	nxQuad  = sqrt(nxQuad/denom);
	nxMish  = sqrt(nxMish/denom);
%
	if FirstOnly, 
		labelstr = 'RMS(Orig)'; 
	else, 
		labelstr = 'Root(Ave(MSE(Shifted)))';
	end
%
	fprintf('Quad:    RMS(CSpin) =%g %s = %g \n',norm(xhQuad-xQuad),labelstr,nxQuad)
	fprintf('Mish:    RMS(CSpin) =%g %s = %g \n',norm(xhMish-xMish),labelstr,nxMish)
%

% figure; 
	axQuad = [.05 .35 -15 15]; axQErr = [.05 .35 -4 4];
	axMish = [.05 .35 -20 20]; axMErr = [.05 .35 -4 4];
subplot(221);plot(t,xhQuad); axis(axQuad); 			title(' 14(a) Cycle-Spin SURE CP, QuadChirp')
subplot(222);plot(t,xhMish); axis(axMish);			title(' 14(b) Cycle-Spin SURE CP, MishMash')
subplot(223);plot(t,xhQuad-xQuad); axis(axQErr);	title(' 14(c) Error: Cycle-Spin SURE CP')
subplot(224);plot(t,xhMish-xMish); axis(axMErr);	title(' 14(d) Error: Cycle-Spin SURE CP')

%	Revision History
%		09/29/99	MRD declared D global
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
