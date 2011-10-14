% toon0114 -- Meyer Wavelets
%
%   Wavelet analysis begins by choosing a specific family of wavelets
%   to work with.
%
%   The family is specified by a father and a mother wavelet, and
%   these generate a basis by translation and dilation.
% 
%   Here we illustrate four specific Mother wavelets
%
%       Meyer	3	
%       Meyer	5	
%       Meyer	7   
%       Meyer	9   	
%
	wave = MakeWavelet(4,8,'Meyer',2,'Mother',1024);
	subplot(211);
	t = (1:1024)./1024;
	plot(t(300:800),wave(300:800)); title('Meyer Wavelet (Deg 2)');
%
	wave = MakeWavelet(4,8,'Meyer',3,'Mother',1024);
	subplot(212);
	plot(t(300:800),wave(300:800)); title('Meyer Wavelet (Deg 3)');
%
%	wave = MakeWavelet(4,8,'Meyer',6,'Mother',1024);
%	subplot(223);
%	plot(t(300:800),wave(300:800)); title('Meyer Wavelet (Deg 6)');
%
%	wave = MakeWavelet(4,8,'Meyer',8,'Mother',1024);
%	subplot(224);
%	plot(t(300:800),wave(300:800)); title('Meyer Wavelet (Deg 8)');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
