% CorrelInit -- Initialize all global variables for CorrelDemo
global N rho
global t 
global L qmf alpha
global zz
global xDoppler yDoppler yzDoppler ybDoppler Doppler axDoppler
global dat tru range Lc qmfC wcC MADest nois

   N   = 2048; 
   rho = 7;
   qmf = MakeONFilter('Symmlet',8);
   L   = 6;
   t = (0:(N-1))./N;
   sigvec = 2.^( (-.4) .* (0:5) );

   randn('seed',12);

   alpha = .9

   zz = fbm(alpha,N);
   zz = zz ./ std(zz);

   ab = [ 1 -1.333 .8889];
   Doppler   = MakeSignal('Doppler',N);
   [xDoppler,ybDoppler,zAR] = Noisegen(Doppler,rho,ab);
   [xDoppler,yzDoppler,zz] = NoiseFrac(Doppler,rho,alpha);

   axDoppler=  [ 0 1 (-15) 15];



disp('Initializing Parameters:')
disp(sprintf('N = %g',N))
disp(sprintf('L = %g',L))


% Load Ion Channel data: see remarks in corfig04.m for more details
% loads dat tru nois
load datasave


snr = std(tru)/std(nois);	%snr = .5475

range = 1000 + (1025:(1025+2047));

qmfC = MakeONFilter('Haar');
LC = 4;
wcC = FWT_PO(dat,LC,qmfC);
noiswcC = FWT_PO(nois,4,qmfC);
MADest =  ScaleMaker( wcC, 5, 'MAD' );
 

%	Revision History
%		09/29/99	MRD	declared nois global
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
