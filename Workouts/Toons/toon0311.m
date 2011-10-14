% toon0311 -- Analysis of Sinusoid with Haar Wavelet
%
	n       = 4096;
	t       = (1:n)./n;
	Sine 	= sin(2*pi*t);
%
	qmf = MakeONFilter('Haar');
	wc  = FWT_PO(Sine,1,qmf);

%
	subplot(221); plot(t,Sine);
	title('Sine Wave');
%
	subplot(222); PlotWaveCoeff(wc,1,.5);
	title('Haar Transform of Sine')
%
	subplot(223); 
	for j=4:11,
		nrmr(j) = norm(wc(dyad(j)));
	end
	semilogy(4:11,nrmr(4:11))
	title('Levelwise norm of Haar Coefficients')
	axis([0 11 10^(-6) 10^1 ])
%
	subplot(224); 
	ordcoef = reverse(sort(abs(wc)));
	semilogy(ordcoef)
	title('Ordered Haar Coefficients')
	axis([0 300 10^(-6) 10^1 ])
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
