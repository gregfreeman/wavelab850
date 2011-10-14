% toon0132 -- Wavelets come at all different scales and positions
% 
%  A Wavelet Basis is a collection of localized, wiggly functions.
%
%  These functions occupy a range of scales and locations.
%
%  The scales go in powers of 2 and the locations occur at
%  integer multiples of the scale.
%
%  Here we show a range of wavelets and their scale-location
%  parameters (j,k), where 2^(-j) is the scale and k/2^j
%  is the location.
%
posarray = [  4 3 ; 4 8; 4 11; 6 12 ; 6 26 ; 6 34; 6 42 ; ...
    7 51; 7 77; 7 101; 8 31; 8 81; 8 102; 8 166; 8 202 ];
sz = size(posarray);
nr = sz(1); 
w = zeros(1,1024);
t = (.5:1023.5) ./1024;
qSymm8 = MakeONFilter('Symmlet',8);
%
clf; subplot(111);
LockAxes([0 1 0 (nr+1)]); 
%
title('Some S8 Symmlets at various scales and locations')
for i=1:nr,
    scal = posarray(i,1);
    loc  = posarray(i,2);
	w(dyad2ix(scal,loc)) = 1;
	x = IWT_PO(w,4,qSymm8);
	plot(t,i+x)
    txt = sprintf('(%1.0f,%2.0f)',scal,loc);
    text(.91,i+.275,txt);
    w(dyad2ix(scal,loc)) = 0;
end
UnlockAxes;
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
