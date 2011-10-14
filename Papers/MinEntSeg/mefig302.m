% mefig302 -- Segmented Wavelet Transform at variable locations 
%
% Here we compare the ordinary, non-segmented, wavelet transform
% of object "Ramp" with the segmented wavelet transform. We try
% segmentation points near to the actual discontinuity of the object.
% segmentation points closer to the actual discontinuity point give
% sparser looking wavelet transforms.
%
% Note: this script computes an object ent used by mefig303.
%
	global Ramp n id 
	global E2 F2
	global ent
%
	L=5; D=2;  
	wc = FWT_AI(Ramp,L,D,F2,E2);
%
	%clf;
    subplot(221)
	PlotWaveCoeff(wc,L,1)
	eord = sum(sqrt(abs(wc(2^(L)+1:n))));
	xlabel('t'); ylabel('dyad');
	titl = sprintf('3.2a Ordinary Transform of Ramp');
	title(titl)
	plotnum =2;
%
	ent = zeros(4,16); 
	for spot = (id-8):(id+7),
	  tt = spot / n; 
	  wc = FWT_SegAI(Ramp,L,D,F2,E2,tt);
	  ent(1,9+spot-id) = sum(sqrt(abs(wc(2^(L)+1:n))));
	  ent(2,9+spot-id) = sum((abs(wc(2^(L)+1:n))));
	  ent(3,9+spot-id) = - sum((wc(2^(L)+1:n).^2).* log(eps + wc(2^(L)+1:n).^2));
	  ent(4,9+spot-id) = sum(wc(2^(L)+1:n).^2);
	  if spot > (id-2) & spot < (id+2),
		 subplot(2,2,plotnum); plotnum = plotnum+1;
	     PlotWaveCoeff(wc,L,1); 
		 xlabel('t'); ylabel('dyad');
	     titl = sprintf('Transform Segmented at t=%g/2048',spot)
	     title(titl);
	  end
	end
%  
% Prepared for the paper Minimum Entropy Segmentation 
% Copyright (c) 1994 David L. Donoho
%  
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
