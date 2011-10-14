% toon0112 -- Interpolating Wavelets
%
%   Wavelet analysis begins by choosing a specific family of wavelets
%   to work with.
%
%   The family is specified by a father and a mother wavelet, and
%   these generate a basis by translation and dilation.
% 
%   Here we illustrate four specific Mother wavelets
%
%       Interp	3	
%       Interp	5	
%       Interp	7   
%       Interp	9   
%
	wave = MakeWavelet(4,8,'Interpolating',3,'Mother',1024);
	subplot(221);
	t = (1:1024)./1024;
	plot(t(300:800),wave(300:800)); title('Interpolating Wavelet (Deg 3)');
%
	wave = MakeWavelet(4,8,'Interpolating',5,'Mother',1024);
	subplot(222);
	plot(t(300:800),wave(300:800)); title('Interpolating Wavelet (Deg 5)');
%
	wave = MakeWavelet(4,8,'Interpolating',7,'Mother',1024);
	subplot(223);
	plot(t(300:800),wave(300:800)); title('Interpolating Wavelet (Deg 7)');
%
	wave = MakeWavelet(4,8,'Interpolating',9,'Mother',1024);
	subplot(224);
	plot(t(300:800),wave(300:800)); title('Interpolating Wavelet (Deg 9)');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
