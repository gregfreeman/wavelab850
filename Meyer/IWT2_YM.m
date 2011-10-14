function ymat = IWT2_YM(wmat,C,deg)
% IWT2_YM -- 2d Inverse Wavelet Transform (periodized Meyer Wavelet)
%  Usage
%    x = IWT2_YM(wc,L,deg)
%  Inputs
%    wc   2-d wavelet transform, size(wc) = [2^J,2^J].
%    L    Coarsest Level of V_0;  L << J
%    deg  degree of polynomial window 2 <= deg <=4
%  Outputs
%    x    1-d reconstructed signal; length(x) = 2^J
%
%  Description
%    The 2d Meyer wavelet transform is obtained by the command
%        wc = FWT2_YM(x,L,deg)
%
%    To reconstruct x, use IWT2_YM.
%
%    The Meyer wavelet is defined in the frequency domain.
%    The algorithm is very different from usual quadrature
%    mirror filter algorithms.  See the Ph. D. Thesis of
%    Eric Kolaczyk.
%
%  See Also
%    FWT2_YM, CoarseMeyerProj, DetailMeyerProj, FineMeyerProj
%
%
	if C < 3,
			'C must be >= 3.  C set to 3.'
			C = 3;
	end
%
	ymat = wmat .* 0 ;
	nn = length(ymat(1,:));
	J = log2(nn);
%
%  Compute coarse level projection.
%

	crc = flipud(wmat([1:(2^C)],[1:(2^C)]));
	cr  = zeros(nn,2^C);
	for m = 1:1:(2^C),
		w = crc(:,m).';
		y = real(ifft(CoarseMeyerProj(w,C,nn,deg)));
		cr(:,m) = y.';
	end
	
	for m = 1:1:nn,
		ymat(m,:) = real(ifft(CoarseMeyerProj(cr(m,:),C,nn,deg)));
	end
%
%  Compute projections for levels j = C, ... , J-2.
%
	for j = C:1:(J-2),
	
	%  Compute horizontal contribution.
		drc = flipud(wmat([1:(2^j)],[(2^j+1):2^(j+1)]));
		dr = zeros(nn,2^j);
		for m = 1:1:(2^j),
			w = drc(:,m).';
			y = real(ifft(DetailMeyerProj(w,j,nn,deg)));
			dr(:,m) = y.';
		end
	
		for m = 1:1:nn,
			ymat(m,:) = ymat(m,:)+real(ifft(CoarseMeyerProj(dr(m,:),j,nn,deg)));
		end
	
	%  Compute vertical contribution.
		drc = flipud(wmat([(2^j+1):(2^(j+1))],[1:(2^j)]));
		for m = 1:1:(2^j),
			w = drc(:,m).';
			y = real(ifft(CoarseMeyerProj(w,j,nn,deg)));
			dr(:,m) = y.';
		end
	
		for m = 1:1:nn,
			ymat(m,:) = ymat(m,:)+real(ifft(DetailMeyerProj(dr(m,:),j,nn,deg)));
		end
	
	%  Compute diagonal contribution.
		drc = flipud(wmat([(2^j+1):(2^(j+1))],[(2^j+1):(2^(j+1))]));
		for m = 1:1:(2^j),
			w = drc(:,m).';
			y = real(ifft(DetailMeyerProj(w,j,nn,deg)));
			dr(:,m) = y.';
		end
	
		for m = 1:1:nn,
			ymat(m,:) = ymat(m,:)+real(ifft(DetailMeyerProj(dr(m,:),j,nn,deg)));
		end
	end
%
%  Compute projection for level j = J-1.
%
%  Compute horizontal contribution.
%
	drc = flipud(wmat([1:(2^(J-1))],[(2^(J-1)+1):(2^J)]));
	for m = 1:1:(2^(J-1)),
		w = drc(:,m).';
		y = real(ifft(FineMeyerProj(w,(J-1),nn,deg)));
		dr(:,m) = y.';
	end
	
	for m = 1:1:nn,
		ymat(m,:) = ymat(m,:)+real(ifft(CoarseMeyerProj(dr(m,:),(J-1),nn,deg)));
	end
	
	%  Compute vertical contribution.
	drc = flipud(wmat([(2^(J-1)+1):(2^J)],[1:(2^(J-1))]));
	for m = 1:1:(2^(J-1)),
		w = drc(:,m).';
		y = real(ifft(CoarseMeyerProj(w,(J-1),nn,deg)));
		dr(:,m) = y.';
	end
	
	for m = 1:1:nn,
		ymat(m,:) = ymat(m,:)+real(ifft(FineMeyerProj(dr(m,:),(J-1),nn,deg)));
	end
	
	%  Compute diagonal contribution.
	drc = flipud(wmat([(2^(J-1)+1):(2^J)],[(2^(J-1)+1):(2^J)]));
	for m = 1:1:(2^(J-1)),
		w = drc(:,m).';
		y = real(ifft(FineMeyerProj(w,(J-1),nn,deg)));
		dr(:,m) = y.';
	end
	
	for m = 1:1:nn,
		ymat(m,:) = ymat(m,:)+real(ifft(FineMeyerProj(dr(m,:),(J-1),nn,deg)));
	end
	
	ymat = nn*flipud(ymat);


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
