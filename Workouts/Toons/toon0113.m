% toon0113 -- Average Interpolating Wavelets
%
%   Wavelet analysis begins by choosing a specific family of wavelets
%   to work with.
%
%   The family is specified by a father and a mother wavelet, and
%   these generate a basis by translation and dilation.
% 
%   Here we illustrate four specific Mother wavelets
%
%       AverageInterp	3	
%       AverageInterp	5	
%       AverageInterp	7   
%       AverageInterp	9   
%
	wave = MakeWavelet(4,8,'AverageInterpolating',2,'Mother',1024);
	subplot(221);
	t = (1:1024)./1024;
	plot(t(300:800),wave(300:800)); title('Average Interpolating Wavelet (Deg 2)');
%
	wave = MakeWavelet(4,8,'AverageInterpolating',4,'Mother',1024);
	subplot(222);
	plot(t(300:800),wave(300:800)); title('Average Interpolating Wavelet (Deg 4)');
%
	wave = MakeWavelet(4,8,'AverageInterpolating',6,'Mother',1024);
	subplot(223);
	plot(t(300:800),wave(300:800)); title('Average Interpolating Wavelet (Deg 6)');
%
	wave = MakeWavelet(4,8,'AverageInterpolating',8,'Mother',1024);
	subplot(224);
	plot(t(300:800),wave(300:800)); title('Average Interpolating Wavelet (Deg 8)');
 
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
