function sp = wl_spectrum(x,n)
% wl_spectrum -- Called by WLBrowser
%  Usage
%    sp = wl_spectrum(x,n)
% Inputs
%    x    time series
%    n    length of time series
% Outputs
%    sp    power spectrum of input data
%
% Description
%    Computes and returns power spectrum in conventional way.
%
sp = abs(fft(x)).^2;
sp = sp(1:n);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
