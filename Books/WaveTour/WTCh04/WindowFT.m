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
%     1. Suppose signal is non-periodic, which I mean zeros outside sampling.
%  Examples
%    t = (1:16)./16 - .5;
%    sig = sin(pi*t) + cos(2*pi*t) + sin(8*pi*t) + cos(8*pi*t);
%    plot(sig);
%    figure;
%    specgm = WindowFT(sig);
%  See Also
%    MakeWindow Spectrogram
%  References
%    Mallat, "Wavelet Signal Processing"; 4.2.3 Discrete Window Fourier
%    Transform.
%
	sig = sig(:);
	n = length(sig);
	f = [zeros(n,1); sig; zeros(n,1)];
%	totseg = zeros(1,n);
	totseg = zeros(1,3*n);
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
%	specgm = zeros(2*w+1,nw);
	specgm = zeros(n,nw);
	ix     = ((-w):w);
	win    = MakeWindow(Name,w);
	win    = win(:);
% Computing Window Fourier Transform
	for l=1:nw,
		t = 1+ (l-1)*m;
%		if m==1 & rem(t,16)==1,
%			fprintf('Window Fourier Transform: t=%i\n',t);
% 		end;
		tim = n + t + ix;
		seg = f(tim);
		seg = seg.*win;
%	        totseg(n/2-w : n/2+w) = seg;
		totseg(tim) = seg;

%		localspec = fft(seg(1:(2*w+1)));
%		specgm(:,l)  = localspec(1:(2*w+1));

		localspec = fft(totseg(n+1:2*n));
%		localspec = fft(totseg(1:n));
		specgm(:,l)  = localspec(1:n)';
	end

%
% Make Window Fourier Transform Display
%	specgmShow = abs(specgm(1:(w+1),:));
 	specgmShow = abs(specgm(1:(n/2+1),:));
	spmax = max(max(specgmShow));
	spmin = min(min(specgmShow));
	colormap(1-gray(256))
%	image(linspace(0,n,n),linspace(0,n/2,w+1),256*(specgmShow-spmin)/(spmax-spmin));
	image(linspace(0,n,n),linspace(0,n/2,n/2+1),256*(specgmShow-spmin)/(spmax-spmin));

	axis('xy')
	xlabel('')
	ylabel('Frequency')

	if nargout==0,
		specgm = [];
	end
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
