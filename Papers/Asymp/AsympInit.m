% AsympInit -- setup all global variables
global xblocks yblocks
global xbumps ybumps
global xheavi yheavi
global xDoppler yDoppler
global N t rho L qmf xh
global Blocks Bumps Doppler HeaviSine
%
  if isempty(N),
     N = 2048;
     rho = 7;
     qmf = MakeONFilter('Symmlet',8);
     L   = 6;
   end

  t = (0:(N-1))/N;
%
  HeaviSine = MakeSignal('HeaviSine',N);
  Bumps     = MakeSignal('Bumps',N);
  Blocks    = MakeSignal('Blocks',N);
  Doppler   = MakeSignal('Doppler',N);
%
  rand('seed',0);
  [xblocks,yblocks] = NoiseMaker(Blocks,rho);
  [xbumps,ybumps] = NoiseMaker(Bumps,rho);
  [xheavi,yheavi] = NoiseMaker(HeaviSine,rho);
  [xDoppler,yDoppler] = NoiseMaker(Doppler,rho);
%
  disp('Initializing Parameters:')
  disp(sprintf('N = %g',N))
  disp(sprintf('rho = %g',rho))
  disp(sprintf('L = %g',L))

% Revision History
%		09/29/99	MRD		declared xh global
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
