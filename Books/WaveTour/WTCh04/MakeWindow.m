function win = MakeWindow(Name,n)
% MakeWindow -- Make artificial Window
%  Usage
%    wig = MakeWindow(Name,n)
%  Inputs
%    Name   string: 'Rectangle', 'Hanning', 'Hamming',
%            'Gaussian', 'Blackman';
%    n      desired half Window length
%  Outputs
%    win    1-d Window, with length 2n+1;
%  Description
%    Rectangle		1
%    Hanning 		cos(pi*t)^2
%    Hamming		.54 + .46cos(2pi*t)
%    Gaussian		exp(-18 * t^2/2)
%    Blackman		.42 + .50*cos(2pi*t) + .08cos(4.*pi.*t)
%  Examples
%     win = MakeWindow('Rectangle',17);	plot(win);
%     win = MakeWindow('Hanning',  17);	plot(win);
%     win = MakeWindow('Hamming',  17);	plot(win);
%     win = MakeWindow('Gaussian', 17);	plot(win); 
%     win = MakeWindow('Blackman', 17);	plot(win);
%  See Also
% 
%  Algorithm
%    Easy to implement.
%  References
%    Mallat, "Wavelet Signal Processing"; 4.2.2 Choice of Window.
%
 t = ((1:(2*n+1))-(n+1))./n./2;

 if strcmp(Name,'Rectangle'),
 	win = ones(size(t));
 elseif strcmp(Name,'Hanning'),
	win = realpow(cos(pi.*t),2);
 elseif strcmp(Name,'Hamming'),
	win = .54 + .46*cos(2.*pi.*t);
 elseif strcmp(Name,'Gaussian'),
	win = exp(-realpow(t,2)*18);
 elseif strcmp(Name,'Blackman'),
	win = .42 + .50*cos(2.*pi.*t) + .08*cos(4.*pi.*t);
 end;

%
 

%
% Copyright (c) 1996. Xiaoming Huo
% 
% Modified by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
