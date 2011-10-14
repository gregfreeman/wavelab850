% idfig08 -- Ideal Figure 08: Wavelet Shrinkage in Wavelet Domain
%
% The four reconstructions of figure 7 are depicted in the
% wavelet domain.
%
% Compare also the ideal reconstructions of figure 6.
%
global shblocks shbumps shheavi shDoppler
global yblocks ybumps yheavi yDoppler  %AM 10/05

global L qmf    %AM 10/05
%
    [sbumps,shbumps]     = WaveShrink(ybumps ,'MinMax',L,qmf);
	[sblocks,shblocks]   = WaveShrink(yblocks,'MinMax',L,qmf);
	[sheavi,shheavi]     = WaveShrink(yheavi ,'MinMax',L,qmf);
	[sDoppler,shDoppler] = WaveShrink(yDoppler,'MinMax',L,qmf);
%    
%clf; 
claxis
%
   subplot(221)
   IMJPlotWaveCoeff(shblocks,L,.05);
   title(' 8 (a) WaveSelect[Blocks] ')
%
   subplot(222)
   IMJPlotWaveCoeff(shbumps,L,.05);
   title(' 8 (b) WaveSelect[Bumps] ')
%
   subplot(223)
   IMJPlotWaveCoeff(shheavi,L,.05);
   title(' 8 (c) WaveSelect[HeaviSine] ')
%
   subplot(224)
   IMJPlotWaveCoeff(shDoppler,L,.05);
   title(' 8 (d) WaveSelect[Doppler] ')
%
 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
