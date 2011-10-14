% CSInit -- setup global datastructures for SpinCycle
%
global Blocks Bumps HeaviSine Doppler
global xblocks xbumps xheavi xDoppler
global yblocks ybumps yheavi yDoppler
global t N rho 
global QuadChirp MishMash n
global xQuad yQuad
global xMish yMish
global n % MRD 09/29/99
%
	if isempty(N),
	     N = 2048;
	end
	if isempty(rho),
	     rho = 7;
	end
	t = (0:(N-1))/N;
%
	disp('Initializing Parameters:')
	disp(sprintf('N = %g',N))
	disp(sprintf('rho = %g',rho))
%
	HeaviSine = MakeSignal('HeaviSine',N);
	Bumps     = MakeSignal('Bumps',N);
	Blocks    = MakeSignal('Blocks',N);
	Doppler   = MakeSignal('Doppler',N);
%
	[xblocks,yblocks] = NoiseMaker(Blocks,rho);
	[xbumps,ybumps]   = NoiseMaker(Bumps,rho);
	[xheavi,yheavi]   = NoiseMaker(HeaviSine,rho);
	[xDoppler,yDoppler] = NoiseMaker(Doppler,rho);
%
	n = N;
	QuadChirp = MakeSignal('QuadChirp',n);
	MishMash  = MakeSignal('MishMash',n);
%
	[xQuad,yQuad]       = NoiseMaker(QuadChirp,rho);
	[xMish,yMish]       = NoiseMaker(MishMash,rho);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
