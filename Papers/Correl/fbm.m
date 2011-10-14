%function x1 = fbm( alpha = 0.9, m = 4096)
function x1 = fbm( alpha, m)
x = randn(1,m); 
l = m/2 ;
freq = [ 1 1:l (l-1):-1:1 ];
xft = fft(x);
xft(1) = 0;
x1ft = xft .* (freq .^ (- alpha/2 ) );
x1 = real( ifft(x1ft) );
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
