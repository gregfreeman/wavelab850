% toon0221 -- 2d Wavelet Families
%
%  Two-dimensional wavelets may be formed by taking the tensor
%  product of two one-dimensional wavelet functions.
%
%  Here we plot the four tensor products:
%
%       Father(x)*Father(y)
%       Mother(x)*Father(y)
%       Father(x)*Mother(y)
%       Mother(x)*Mother(y)
%
%  for the Haar wavelet.
% 
	qmf = MakeONFilter('Haar');
	n=128;
	x = linspace(0,1.,n); 
	y = linspace(0,1.,n); 
%
%
	w = zeros(n,n);
	[kx,ky] = quad2ix(2,1,1,0);
	w(kx,ky)=1;
	z = IWT2_PO(w,0,qmf);
	tstr = 'Haar; j=2,k=(1,1); FxF';
	subplot(221);
%
	mmin = min(min(z));
	mmax = max(max(z));
	image(x,y,256*(z-mmin)/(mmax-mmin))
	axis('image')
	colormap(gray(256))
%
	title(tstr);
%
	w = zeros(n,n);
	[kx,ky] = quad2ix(2,2,2,1);
	w(kx,ky) = 1;
	z = IWT2_PO(w,0,qmf);
%
	subplot(222);
	mmin = min(min(z));
	mmax = max(max(z));
	image(x,y,256*(z-mmin)/(mmax-mmin))
	axis('image')
	colormap(gray(256))
	tstr = 'Haar; j=2,k=(2,2); MxF';
	title(tstr);
%
	w = zeros(n,n);
	[kx,ky] = quad2ix(2,2,1,2);
	w(kx,ky)=1;
	z = IWT2_PO(w,2,qmf);
%
	subplot(223);
	mmin = min(min(z));
	mmax = max(max(z));
	image(x,y,256*(z-mmin)/(mmax-mmin))
	axis('image')
	colormap(gray(256))
	tstr = 'Haar; j=2,k=(2,1); FxM';
	title(tstr);
%
	w = zeros(n,n);
	[kx,ky] = quad2ix(2,2,1,3);
	w(kx,ky)=1;
	z = IWT2_PO(w,2,qmf);
%
	subplot(224);
	mmin = min(min(z));
	mmax = max(max(z));
	image(x,y,256*(z-mmin)/(mmax-mmin))
	axis('image')
	colormap(gray(256))
	tstr = 'Haar; j=2,k=(2,1); MxM';
	title(tstr);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
