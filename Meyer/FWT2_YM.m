function w = FWT2_YM(x,deg,L)
% FWT2_YM -- 2d Forward Wavelet Transform (periodized Meyer Wavelet)
%  Usage
%    wc = FWT2_YM(x,deg,L)
%  Inputs
%    x    2-d signal; size(x) = [2^J,2^J]
%    deg  degree of polynomial window 2 <= deg <=4
%    L    Coarse Level for V_0;  L << J
%  Outputs
%    w    2-d wavelet transform of x; 2^J by 2^J.
%
%  Description
%    The Meyer wavelet is defined in the frequency domain.
%    The algorithm is very different from usual quadrature
%    mirror filter algorithms.  See the Ph. D. Thesis of
%    Eric Kolaczyk. To reconstruct use IWT2_YM.
%
%  See Also
%    IWT2_YM, CoarseMeyerCoeff, DetailMeyerCoeff, FineMeyerCoeff
%
%
	if L < 3,
			'L must be >= 3.  Enter new value of L or hit Ctrl-C to break.'
			L = input('L = ?');
	end
%
	w = x .* 0 ;
	x = flipud(x);
	nn = length(x(1,:));
	J = log2(nn);
%
%  Compute coefficients at Coarse Level
%

	cr = zeros(nn,2^L);
	for m=1:1:nn,
		cr(m,:) = CoarseMeyerCoeff(fft(x(m,:)),L,nn,deg);
	end
	
	crc = zeros(2^L,2^L);
	for m = 1:1:(2^L),
		y = cr(:,m).';
		w_temp = CoarseMeyerCoeff(fft(y),L,nn,deg) ;
		crc(:,m) = w_temp.';
	end
	
	w([1:(2^L)],[1:(2^L)]) = flipud(crc);
%
%  Compute coefficients for levels j = L, ... , J-2.
%

	for j = L:1:(J-2),
	
		%  Compute horizontal contribution.
		if j == L,
			dr = cr;
		else
			dr = zeros(nn,2^j);
			for m = 1:1:nn,
				dr(m,:) = CoarseMeyerCoeff(fft(x(m,:)),j,nn,deg);
			end
		end
	
		drc = zeros(2^j,2^j);
		for m = 1:1:(2^j),
			y = dr(:,m).';
			w_temp = DetailMeyerCoeff(fft(y),j,nn,deg);
			drc(:,m) = w_temp.';
		end
	
		w([1:(2^j)],[(2^j+1):2^(j+1)]) = flipud(drc);
	
		%  Compute vertical and diagonal contributions
	
		for m = 1:1:nn,
			dr(m,:) = DetailMeyerCoeff(fft(x(m,:)),j,nn,deg);
		end
	
		for m = 1:1:(2^j),
			y = dr(:,m).';
			w_temp = CoarseMeyerCoeff(fft(y),j,nn,deg);
			drc(:,m) = w_temp.';
		end
	
		w([(2^j+1):(2^(j+1))],[1:(2^j)]) = flipud(drc);
	
		for m = 1:1:(2^j),
			y = dr(:,m).';
			w_temp = DetailMeyerCoeff(fft(y),j,nn,deg);
			drc(:,m) = w_temp.';
		end
	
		w([(2^j+1):(2^(j+1))],[(2^j+1):(2^(j+1))]) = flipud(drc);
	
	end

%
%  Compute coefficients for level j = J-1.
%
%  Compute horizontal contribution.

	dr = zeros(nn,(2^(J-1)));
	for m = 1:1:nn,
		dr(m,:) = CoarseMeyerCoeff(fft(x(m,:)),(J-1),nn,deg);
	end
	
	drc = zeros(2^(J-1),2^(J-1));
	for m = 1:1:(2^(J-1)),
		y = dr(:,m).';
		w_temp = FineMeyerCoeff(fft(y),nn,deg);
		drc(:,m) = w_temp.';
	end

	w([1:(2^(J-1))],[(2^(J-1)+1):(2^J)]) = flipud(drc);

%  Compute vertical and diagonal contributions.

	for m = 1:1:nn,
		dr(m,:) = FineMeyerCoeff(fft(x(m,:)),nn,deg);
	end
	
	for m = 1:1:(2^(J-1)),
		y = dr(:,m).';
		w_temp = CoarseMeyerCoeff(fft(y),(J-1),nn,deg);
		drc(:,m) = w_temp.';
	end
	
	w([(2^(J-1)+1):(2^J)],[1:(2^(J-1))]) = flipud(drc);
	
	for m = 1:1:(2^(J-1)),
		y = dr(:,m).';
		w_temp = FineMeyerCoeff(fft(y),nn,deg);
		drc(:,m) = w_temp.';
	end
	
	w([(2^(J-1)+1):(2^J)],[(2^(J-1)+1):(2^J)]) = flipud(drc);

    w=nn*w;
    

%
%  Prepared for the thesis of Eric Kolaczyk, Stanford University, 1994
%  Copyright (c) Eric Kolaczyk, 1994.
%

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
