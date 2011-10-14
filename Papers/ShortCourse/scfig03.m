% scfig03 -- Short Course 03: Comparison of Wavelet and Packet DeNoising
%
% Here a synthetic signal, ``MishMash'', containing a quadratic
% and a linear chirp, along with a high-frequency sinusoid, is
% being studied (Panel a).  A noisy version is created, (Panel b) 
% and this noisy version is then de-noised using wavelet shrinkage.
% (Panel c) The results are poor, in that the fine structure of the 
% oscillating noiselss object is lost.
%
% In contrast, De-noising in an adaptively chosen cosine packet basis
% removes the noise and produces an acceptable approximation to the
% original noiseless object. (Panel d)
%
global tt
global xMish yMish
%
%  xMish, yMish, etc. were created in SCInit
%
ax =  [0 .25 -20 20];
%
	versaplot(221,tt,xMish,[],' 3 (a) Segment of Noiseless object',ax,[]);
	versaplot(222,tt,yMish,[],' 3 (b) Segment of Noisy object',    ax,[]);
%
% wavelets
%
	QCoif3         = MakeONFilter('Coiflet',3);
	[xWave,wcWave] = WaveShrink(yMish,'Visu',3,QCoif3);
	versaplot(223,tt,xWave,[],' 3 (c) Wavelet Basis De-Noising',ax,[]);
%
% wavelet packet
%
	%xWP = WPDeNoise(yMish,7,QCoif3);
	%plot(t,xWP); title(' 3 (c) Wavelet Packet Basis De-Noising');
%
% cosine packet
%
	xCP = CPDeNoise(yMish,6,'Sine');
	versaplot(224,tt,xCP,[],' 3 (d) Cosine Packet Best Basis De-Noising',ax,[]);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
