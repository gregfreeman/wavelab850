function out = TIDenoiseSoft2(Noisy,L,qmf,thresh)
%  TIDenoiseSoft2 -- Translation-Invariant Soft Wavelet Thresholding of
%		Images.
%  Usage 
%    out=TIDenoiseSoft2(Noisy,L,qmf,thresh)
%  Inputs
%    Noisy      Noisy image.
%    L  	Deepness of decomposition.
%    qmf    	Quadrature Mirror Filter for Wavelet Transform
%    thresh	Threshold.
%  Outputs 
%    out    	Restored image.
%

[n,J]=quadlength(Noisy);
out=zeros(n,n);
lim=8;
for i=1:lim,
	for j=1:lim,
		Noistrans = cyclespin2(Noisy,i,j);
		dout = ST2(Noistrans,L,qmf,thresh);
		dout = cyclespin2(dout,n-i,n-j);
		out = out+dout;
	end
end
out=out/(lim*lim);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
