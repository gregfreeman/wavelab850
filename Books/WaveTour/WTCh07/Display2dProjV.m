function Display2dProjV(wc,L,qmf);

[n,J] = quadlength(wc);
% axes handles	
%	delta = (1-2^(L-J-1))./(J-L+2);
	delta = 1/40;
	unit = .45 * 2^(L-J);
	limitx = delta;
	limity = delta;
x = wc; 
	h = [limitx limity unit unit];
	axes('position',h)
	imagesc(x(1:2^L,1:2^L));
	colormap(gray(256));
	axis image
	axis('off')
	limitx = delta + unit;
	unit = 2*unit;
	nc = 2^(L+1);
	for jscal=L:J-1,
		top = (nc/2+1):nc; bot = 1:(nc/2); all = 1:nc;
		for iy=1:nc,
			x(all,iy) =  UpDyadLo(x(bot,iy)',qmf)'  ...
					   + UpDyadHi(x(top,iy)',qmf)'; 
		end
		for ix=1:nc,
			x(ix,all) = UpDyadLo(x(ix,bot),qmf)  ... 
					  + UpDyadHi(x(ix,top),qmf);
		end
		nc = 2*nc;
		h = [limitx limity unit unit];
		axes('position',h)
		imagesc((1:nc/2),(1:nc/2),x(all,all));
		colormap(gray(256));
		axis image
		axis('off')
		limitx = limitx + unit;
		unit = 2*unit;
	end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
