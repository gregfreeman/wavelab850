function sig = IWindowFT(specgm,w,Name)
% IWindowFT -- Inverse Window Fourier Transform
%  Usage
%    sig = IWindowFT(specgm,w,Name)
%  Inputs
%    specgm    Window Fourier Transform of sig, complex matrix
%    w        window half-length used to construct specgm
%    Name     string: 'Rectangle', 'Hanning', 'Hamming',
%             'Gaussian', 'Blackman' 
%              name of window used to construct specgm
%  Outputs
%    sig      1-d signal
%  Side Effects
%    none
%  Description
%     supposes signal is non-periodic, i.e. zero-padded
%     reconstruction is not exact in the border region, but it is
%     exact in the center
%  See Also
%    WindowFT
%  References
%    Mallat, "A Wavelet Tour in Signal Processing"; 
%            4.2.3 Discrete Windowed Fourier Transform.
%

[n,nw] = size(specgm);
f = zeros(3*n,1);
totseg = zeros(3*n,1);
win    = MakeWindow(Name,w);
win    = win(:);
window = zeros(3*n,1);
window(n+1-w:n+1+w,1) = win;

for i = 1:nw,
	totseg(n+1:2*n) = ifft(specgm(:,i)');
	f = f + window.*totseg;
	window = rshift(window')';
end;
f = f(n+1:2*n);
sig = f/norm(window)^2.;
%
% Copyright (c) 1997. Maureen Clerc and Jerome Kalifa
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
