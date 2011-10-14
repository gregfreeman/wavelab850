% Generates results in Table 1 of paper. This code cannot be run without
% access to the full data provided by Bob Eisenberg and Rick Levis (see
% remarks in corfig03.m), but is presented here to document what
% was computed.

global	LC qmfC


%load '/home/imj/matlab/channels/data.dat' ;
%load '/home/imj/matlab/channels/chnl2' ;
%load '/home/imj/matlab/channels/threshold' ;

LL=6;
n = 4096;
summary = [];

for i = 0:9

  seg = 4096*i + (1:4096);
  dat = data(seg);
  tru = chnl2(seg);
  alg = threshold(seg);
  
  wcC = FWT_PO(dat,LC,qmfC);
  thrMAD =  sqrt( 2*log(n) ) .* ScaleMaker(wc, LC, 'MAD');
  xnonti = LevelShrink(dat, LL, qmfC);
  xMAD =  StatShrink( dat, LL, thrMAD, qmfC);
  
  [threshdat, magicdat, scaledat] = MultiSUREThresh(wcC,LC);
  thrvec = threshdat;
  thrvec(9:11) = magicdat(9:11);

  xsure  = StatShrink(dat, LL, thrvec ,qmfC);

  result = [ errtot(dat, tru) errtot(xnonti, tru) errtot(xMAD, tru)  ...
	     errtot(xsure, tru) errtot(alg, tru) ]

  summary = [ summary ; result ] ;
end

summary
mean(summary)
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
