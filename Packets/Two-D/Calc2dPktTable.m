function pkt2 = Calc2dPktTable(TFType,img,D,TFPar)
% Calc2dPktTable -- Put Wavelet/Cosine Packet Coefficients into 2-d Table  
%  Usage
%    pkt2 = Calc2dPktTable(TFType,img,D,TFPar)
%  Inputs
%    TFType   string, 'CP' or 'WP' selecting type of time-frequency analysis
%    img      2-d image, n by n, n dyadic
%    D        maximum depth of splitting
%    TFPar    if 'WP', qmf 
%             if 'CP', bellname
%  Outputs
%    pkt2     packet table
%
%  Description
%    Creates a packet table of maximum depth D for the image specified by img.
%
%  See Also
%    Calc2dStatTree, WP2dTour, CP2dTour
%
	[n,J]  = quadlength(img);
	boxlen = n;
	boxcnt = 1;
	pkt2 = zeros(n*n, D+1);
	jmg = zeros(n,n);
	ss = norm(norm(img));
	coef = img ./ss;
%
	if strcmp(TFType,'WP'), % 2-d Wavelet Packets

		for deep = 0:D,
			for bx=0:(boxcnt-1),
				for by=0:(boxcnt-1),

					[lox,hix,loy,hiy] = quadbounds(deep,bx,by,n);
					Quad = coef(lox:hix,loy:hiy);

					jmg(lox:hix,loy:hiy) = Quad;

					if deep < D,  % prepare for finer scales
						quad = DownQuad(Quad,TFPar,bx,by);
						coef(lox:hix,loy:hiy) = quad;
					end

				end
			end
			boxlen = boxlen/2;
			boxcnt = boxcnt*2;
			pkt2(:,deep+1) = jmg(:);
		end

	else

		m = n / 2^D /2;
		[bp,bm] = MakeONBell('Sine',m);
		boxlen = n;
		boxcnt = 1;
		
		% ideally, fold edges at coarsest scale
		
		for deep = 0:D,
			for bx=0:(boxcnt-1),
				for by=0:(boxcnt-1),

					[lox,hix,loy,hiy] = quadbounds(deep,bx,by,n);
					Quad = dct2_iv(coef(lox:hix,loy:hiy));

					jmg(lox:hix,loy:hiy) = Quad;

					if deep < D,  % prepare for finer scales

						% fold columns
						midlo = floor((lox+hix)/2);
						midhi = ceil ((lox+hix)/2);
						for i=1:m
							colright = coef(midlo+i,loy:hiy);
							colleft  = coef(midhi-i,loy:hiy);
							coef(midlo+i,loy:hiy) = bp(i)*colright + bm(i)*colleft ;
							coef(midhi-i,loy:hiy) = bp(i)*colleft  - bm(i)*colright;
						end
			
						% fold rows
						midlo = floor((loy+hiy)/2);
						midhi = ceil ((loy+hiy)/2);
						for i=1:m
							rowright = coef(lox:hix,midlo+i);
							rowleft  = coef(lox:hix,midhi-i);
							coef(lox:hix,midlo+i) = bp(i)*rowright + bm(i)*rowleft ;
							coef(lox:hix,midhi-i) = bp(i)*rowleft  - bm(i)*rowright;
						end

					end
				end
			end
			boxlen = boxlen/2;
			boxcnt = boxcnt*2;
			pkt2(:,deep+1) = jmg(:);
		end
	end

%
% Copyright (c) 1994-5. Jonathan Buckheit and David Donoho
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
