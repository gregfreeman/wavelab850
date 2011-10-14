% LIMITATIONS -- WaveLab known limitations
%
%  (1) Limited Number of Wavelets in this release
%      bi-orthogonal wavelets are omitted
%      CDJV algorithm has very limited number of wavelets
%
%  (2) Phase discrepancies on Father wavelets
%      coefficient k does not correspond to
%      spatial position k with the Father Wavelets
%      (it does with mother wavelets)
%
%  (3) Default type for Signals ought to be (n by 1), not (1 by n)
%
%  (4) Scripts that do image operations (e.g. scfig12)
%      usually run only on machines with >> 8 Mb CPU memory.
%
%  (5) Generally, we do not check to see if parameters
%      are in range.  Hence, if you select a bizarre
%      value for the wavelet packet table depth D (e.g.
%      D = 1000 rather than D =6 or 8, the function
%      WPAnalysis will fail with an OUT of MEMORY message.
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
