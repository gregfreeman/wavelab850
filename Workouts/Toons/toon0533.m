% toon0533 -- Compare all four methods of analysis on seismic signal
%
%  Show the compression curves for wavelet, DCT, wavelet packet,
%  and cosine packet analysis on the seismic signal.
%
	trace = ReadSignal('Seismic')';  % note transpose
%
	qmf = MakeONFilter('Coiflet',3);
	wc = FWT_PO(trace,4,qmf);
%
	[wpcoef,bb] = BB_WP(trace,10,qmf);
%
	[cpcoef,cpbb] = BB_CP(trace,6);
%
	dccoef = dct_iv(trace);
%
	wprev = reverse(cumsum(sort(wpcoef.^2)));
	wcrev = reverse(cumsum(sort(wc    .^2)));
	dcrev = reverse(cumsum(sort(dccoef.^2)));
	cprev = reverse(cumsum(sort(cpcoef.^2)));
	ymax = log10(wcrev(1));
	ymin = log10(wcrev(100));
%
	subplot(1,1,1);
	semilogy(dcrev,'y--') ; hold on;
	semilogy(wcrev,'b-') ; 
	semilogy(wprev,'r:'); 
	semilogy(cprev,'g-.'); 
	h = text(225,10^(ymax-.3) ,'BBCP -.'); set(h,'Color','Green');
	h = text(225,10^(ymax-.6) ,'BBWP ..'); set(h,'Color','Red');
	h = text(225,10^(ymax-.9),'DWT - '); set(h,'Color','Blue');
	h = text(225,10^(ymax-1.2),'DCT --'); set(h,'Color','Yellow');
	axis([0 300 10^(ymin) 10^(ymax)])
	title('Compression Numbers: Seismic')
	xlabel('m, number of coefficients retained'); 
	ylabel('c_m, (reconstruction error)^2')
	hold off;
    
%  Revision History
%             10/1/05     AM     Changing the name of the variable QMF

    
    
   
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
