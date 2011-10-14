% CAPTION
fprintf('\n');
disp('Figure 9.2')
disp('Window 1: Original Lena image of N^2 = 256^2 pixels.')
disp('Window 2: Linear approximation from the M = N^2/16 Symmlet 4')
disp('wavelet coefficients at the scales 2^j > 2^4.')
disp('The relative norm of the error is 0.036.')

close all;
global WLVERBOSE;
WLVERBOSE='No';
x=256;y=256;
image=ReadImage('Lenna');
n=x*y;
L=2;
qmf=MakeONFilter('Symmlet',4);

wcoef = FWT2_PO(image,L,qmf) ;
wc=wcoef;

	[nc,J] = quadlength(image);

	for jscal=J-1:-1:6,
		top = (nc/2+1):nc; bot = 1:(nc/2);
		for ix=1:nc,
			row = wc(ix,1:nc);
			wc(ix,top) = zeros(1,nc/2);
		end
		for iy=1:nc,
			row = wc(1:nc,iy)';
			wc(top,iy) =  zeros(nc/2,1);
		 end
		nc = nc/2;
	end

out    = IWT2_PO(wc,L,qmf);

value=norm(image-out)/norm(out);

pic256(image);
 set(gcf, 'NumberTitle','off', 'Name','Window 1')
handle_axis = gca;
set(handle_axis,'FontSize', 21);
pic256(out);
 set(gcf, 'NumberTitle','off', 'Name','Window 2')
handle_axis = gca;
set(handle_axis,'FontSize', 21);
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
