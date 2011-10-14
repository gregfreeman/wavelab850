function Compare4Compress(x,Title,qmf,wpdepth,cpdepth,axlim)
% Compare4Compress -- Compare WP and CP Compressions
%  Usage
%    Compare4Compress(x,Title,qmf,wpdepth,cpdepth,axlim)
%

	if nargin < 6,
		axlim = [ (-2) 4 ];
	end
	ymax = axlim(2);
	ymin = axlim(1);
	
%
%    1. WT
%
	wc = FWT_PO(x,4,qmf);
%
%    2. WPT
%
	wpt = WPAnalysis(x,wpdepth,qmf);
	stt = CalcStatTree(wpt,'Entropy');
	[btree,vtree] = BestBasis(stt,wpdepth);
	wpcoef = UnpackBasisCoeff(btree,wpt);
%
%    3. CPT
%
	cpt = CPAnalysis(x,cpdepth,'Sine');
	stt = CalcStatTree(cpt,'Entropy');
	[btree,vtree] = BestBasis(stt,cpdepth);
	cpcoef = UnpackBasisCoeff(btree,cpt);
%
%    4. DCT
%
	dccoef = dct_iv(x);
%
%    5. Compression Numbers
%
	wprev = reverse(cumsum(sort(wpcoef.^2)));
	wcrev = reverse(cumsum(sort(wc    .^2)));
	dcrev = reverse(cumsum(sort(dccoef.^2)));
	cprev = reverse(cumsum(sort(cpcoef.^2)));
%
%    6. Display Compression Numbers
%
	semilogy(cprev,'r--'); 
	axis([0 500 10^(ymin) 10^(ymax)])
	hold on;
	semilogy(wprev,'g-.'); 
	semilogy(wcrev,'b-'); 
	semilogy(dcrev,'y:'); 
	h = text(400,10^(ymax-.5) ,'CPT --'); set(h,'Color','Red');
	h = text(400,10^(ymax-.9) ,'WPT -.'); set(h,'Color','Green');
	h = text(400,10^(ymax-1.3),'DWT - '); set(h,'Color','Blue');
	h = text(400,10^(ymax-1.7),'DCT ..'); set(h,'Color','Yellow');
	title(['Compression Numbers: ' Title ]);
	xlabel('number of coefficients retained'); 
	ylabel('reconstruction error')
	hold off;
    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
