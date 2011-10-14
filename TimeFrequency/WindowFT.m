function specgm = WindowFT(sig,w,m,Name,titl)
% WindowFT -- Window Fourier Transform
%  Usage
%    specgm = WindowFT(sig,w,m,Name,titl)
%  Inputs
%    sig      1-d signal
%    w        window half-length, default = n/2
%    m        inter-window spacing, default=1
%    Name     string: 'Rectangle', 'Hanning', 'Hamming',
%             'Gaussian', 'Blackman'; Default is 'Rectangle'
%    titl     Optional Title String Modifier
%  Outputs
%    specgm   Window Fourier Transform of sig, n+1 by n complex matrix
%  Side Effects
%    Image Plot of the Window Fourier Transform
%  Description
%  Algorithm
%     supposes signal is non-periodic, i.e. zero-padded
%  Example
%    sig = ReadSignal('Caruso');
%    sig = sig(1:128);
%    specgm = WindowFT(sig);
%  See Also
%    MakeWindow IWindowFT
%  References
%    Mallat, "A Wavelet Tour in Signal Processing"; 
%            4.2.3 Discrete Windowed Fourier Transform.
%
	sig = sig(:);
	n = length(sig);
	f = [zeros(n,1); sig; zeros(n,1)];
% Default parameters,
	if nargin < 2,
		w = n/2;
	end;
	if nargin < 3,
		m=1;
	end;
	if nargin < 4,
		Name = 'Rectangle';
	end;
	if nargin < 5,
		titl = [];
	end;
% Initialize output matrix,
	nw     = floor(n ./ m);
	specgm = zeros(n,nw);
	ix     = ((-w):w);
	win    = MakeWindow(Name,w);
	win    = win(:);
% Computing Window Fourier Transform
	for l=1:nw,
	        totseg = zeros(1,3*n);
		t = 1+ (l-1)*m;
		tim = n + t + ix;
		seg = f(tim);
		seg = seg.*win;

		totseg(tim) = seg;

		localspec = fft(totseg(n+1:2*n));
		 specgm(:,l)  = localspec(1:n)';
%window = rshift(window')';
end
%
% Make Window Fourier Transform Display
 	specgmShow = abs(specgm(1:(n/2+1),:));
	spmax = max(max(specgmShow));
	spmin = min(min(specgmShow));
	colormap(1-gray(256))
	image(linspace(0,n,n),linspace(0,n/2,n/2+1),256*(specgmShow-spmin)/(spmax-spmin));

	axis('xy')
	xlabel('')
	ylabel('Frequency')

	if nargout==0,
		specgm = [];
	end
%
% Copyright (c) 1996. Xiaoming Huo
% 
% Modified by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
