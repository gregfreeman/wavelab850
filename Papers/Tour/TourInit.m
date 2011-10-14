% TourInit -- setup global datastructures for Tour
%
global Blocks Bumps HeaviSine Doppler
global xblocks xbumps xheavi xDoppler
global yblocks ybumps yheavi yDoppler
global t N rho alf
%
	if isempty(N),
	     N = 2048;
	end
	if isempty(rho),
	     rho = 7;
	end
	if isempty(alf),
	      alf = .9;
	end
	t = (0:(N-1))/N;
%
	disp('Initializing Parameters:')
	disp(sprintf('N = %g',N))
	disp(sprintf('rho = %g',rho))
	disp(sprintf('alf = %g',alf))
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
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
