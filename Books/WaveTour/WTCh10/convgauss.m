function [g,convsig] = convgauss(sig_in,bool)
% congauss -- Convolution of a signal with a gaussian filter.
% Usage
%   convsig=convgauss(sig_in)
% Inputs
%   sig_in	1-d signal.
% Outputs
%   sig_out	1-d filtered signal.
%

n=length(sig_in);
if nargin<2,
	bool=1;
end
 
%t = (1:n)/n;
%sigma = 40/n;
%g = exp(-.5.*(abs(t-.5)./sigma).^2)./sigma./sqrt(pi);
%no=norm(g);
%plot(abs(fft(g)))
%g=1/(no*2*pi) * g;
%g = fftshift(g);
%convsig = iconv(g,sig_in); 

alpha=(2.9)/n;
g=zeros(1,n);
lim=alpha*n;
mult=pi/(2*alpha*n);
g(1:fix(lim))=(cos(mult*(1:fix(lim)))).^2;
g((n/2+1):n)=g((n/2):-1:1);
%g = rnshift(g,n/2);
G=fft(g);
G(n/2+1)=G(n/2);
g=g/abs(G(1));
if bool==-1
	convsig=real(abs(G(1))*ifft(fft(sig_in)./G));
else
	convsig=iconv(g,sig_in);
end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
