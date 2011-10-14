% toon0111 -- Wavelet Families
%
%   Wavelet analysis begins by choosing a specific family of wavelets
%   to work with.
%
%   The family is specified by a father and a mother wavelet, and
%   these generate a basis by translation and dilation.
% 
%   Here we illustrate four specific Mother wavelets
%
%       Haar          -- the first wavelet; a square-wave wavelet
%
%       Daubechies D4 -- the first continuous, compactly supported
%                        orthonormal wavelet family
%
%       Coiflet C3    -- orthonormal wavelets system where both father and
%                        mother have special vanishing moments properties
%
%       Symmlet S8    -- nearly-symmetric orthogonal wavelet of
%                        compact support with 8 vanishing moments.
% 
	
%
	wave = MakeWavelet(4,8,'Haar',[],'Mother',1024);
	subplot(221);
	t = (1:1024)./1024;
	plot(t(300:800),wave(300:800)); title(' Haar Wavelet ');
%
	wave = MakeWavelet(4,8,'Daubechies',4,'Mother',1024);
	subplot(222);
	plot(t(300:800),wave(300:800)); title(' D4 Wavelet ');
%
	wave = MakeWavelet(4,8,'Coiflet',3,'Mother',1024);
	subplot(223);
	plot(t(300:800),wave(300:800)); title(' C3 Coiflet ');
%
	wave = MakeWavelet(4,8,'Symmlet',8,'Mother',1024);
	subplot(224);
	plot(t(300:800),wave(300:800)); title(' S8 Symmlet ');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
