function awt = AWT(x,nvoice,Name,sigma2,par2)
% AWT -- Analytical Wavelet Transform
%  Usage
%    awt = AWT(x,nvoice,Name,sigma2,par2);
%  Inputs
%    x	     signal, could be complex
%    nvoice  number of voices
%            default = 12
%    Name    Type of Window function, so far only "Gaussian" window available
%    sigma2    first parameter, for Gaussian window, it could be variance,
% 	     default = 1
%    par2    another parameter, for Gaussian, it's xi(shifting frequency)
%            default = 5
%  Outputs
%    awt     Analytical wavelet transform of x
%  Side Effects
%  Description
%    Coarsest scale is '2', finest scale is (log2(n)-5);
%    awt is a n by nscale matrix;
%  Algorithm
%     
%  Examples
%    n = 1024;
%    t = ((1:n)./n - .5).*pi;
%    f = exp(i*t.^2);
%    awt = AWT(f);
%    ImageCWT(awt,'Individual','hot');
%    ix = [((n/2+1):n),(1:n/2)];
%    plot(abs(awt(ix,1)))	% should looks Gaussian
%    hold on
%    plot(abs(awt(ix,13)))	% should looks Gaussian
%    plot(abs(awt(ix,25)))	% should looks Gaussian
%  See Also
%    ImageCWT
%  References
%    Mallat, "A Wavelet Tour of Signal Processing";
%             4.4.3 Analytical Wavelet Transform
%
  n = length(x);

% set default values
  if nargin < 4,
	sigma2 = 1; xi = 5;
  end;
  if nargin < 3,
	Name = 'Gabor';
  end;
  if nargin < 2,
 	nvoice = 12;
  end;

% Fourier Transform of signal
  fftx = fft(x(:));
  omega   = [ (0: (n/2)) (((-n/2)+1):-1) ] .* (2*pi/n);

  noctave = floor(log2(n))-4;
  nscale  = nvoice .* noctave;

  awt = zeros(n,nscale);

  kscale  = 1;
  scale   = 2;

  for jo = 1:noctave,
     for jv = 1:nvoice,
        s =  scale .* (2^(jv/nvoice));
        if strcmp(Name,'Gabor'),
      	      freq =  (s .* omega  - xi);
              freq = freq(:);
	      omega = omega(:);
	      Psi = realpow(4.*pi.*sigma2,1/4)*exp(-sigma2/2*freq.*freq);
              Psi = Psi .* (omega>0);
        end; 
	awt(1:n,kscale) = ifft(fftx.*Psi);
	kscale = kscale + 1;
     end;
     scale  = scale .*2;
  end;
% the matrix awt is ordered from high to low frequencies


%
% Copyright (c) 1996. Xiaoming Huo
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
