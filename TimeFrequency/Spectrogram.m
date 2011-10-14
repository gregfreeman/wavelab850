% Spectrogram -- Time-Varying Spectrum
%  Usage
%    specgm = Spectrogram(sig,w,m,titl)
%  Inputs
%    sig      1-d signal
%    w        window half-length, default = n/2
%    m        inter-window spacing, default=1
%    titl     Optional Title String Modifier
%  Outputs
%    specgm   spectrogram
%
%  Side Effects
%    Image Plot of the spectrogram
%
%  See Also
%    WVDist, WVDist_AF, ImagePhasePlane
%
%
	sig = x(:);
	n = length(x);
	f = [zeros(n,1); sig; zeros(n,1)];
%
	if nargin < 2,
		w = n/2;
	end
	if nargin < 3,
		m=1;
	end
	if nargin < 4,
		titl = [];
	end
%
	nw     = floor(n ./ m);
	specgm = zeros(w+1,nw);
	ix     = ((-w+1):w);
%
	for l=1:nw,
		t = 1+ (l-1)*m;
		if m==1 & rem(t,16)==1,
			fprintf('Spectrogram: t=%i\n',t);
 		end

		tim = n + t + ix;
		seg = f(tim);
		localspec = abs(fft(seg));
		specgm(:,l)  = localspec(1:(w+1));
	end

%
% Make Spectrogram Display

	spmax = max(max(specgm));
	spmin = min(min(specgm));
	colormap(1-gray(256))
	image(linspace(0,1,n),linspace(0,1,w+1),256*(specgm-spmin)/(spmax-spmin));
	axis('xy')
	xlabel('Time')
	ylabel('Frequency')
%
	titl = AppendTitle('Spectrogram',titl);
	title(titl);
%
	if nargout==0,
		specgm = [];
	end

%
% Copyright (c) 1995, David Donoho
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
