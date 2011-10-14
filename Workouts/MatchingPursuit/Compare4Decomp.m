function Compare4Decomp(x,Title,qmf,wpdepth,cpdepth)
% Compare4Decomp -- Compare four ways of decomposing object
%  Usage
%    Compare4Decomp(x,Title,qmf,wpdepth,cpdepth)
%
%  Description
%    Show all four ways of decomposing object:
%
%       Best Basis, CP
%       Best Basis, WP
%       MP,CP
%       MP,WP
%

	if nargin < 8,
		axlim = [ (-2) 4 ];
	end
	ymax = axlim(2);
	ymin = axlim(1);
	
%
%    1. Best Basis WP
%
	wpt = WPAnalysis(x,wpdepth,qmf);
	stt = CalcStatTree(wpt,'Entropy');
	[btree,vtree] = BestBasis(stt,wpdepth);
	wpcoef = UnpackBasisCoeff(btree,wpt);
%
%    2. Best Basis CP
%
	cpt = CPAnalysis(x,cpdepth,'Sine');
	stt = CalcStatTree(cpt,'Entropy');
	[btree,vtree] = BestBasis(stt,cpdepth);
	cpcoef = UnpackBasisCoeff(btree,cpt);
%
%    5. Compression Numbers
%
	bbwp = reverse(cumsum(sort(wpcoef.^2)));
	bbcp = reverse(cumsum(sort(cpcoef.^2)));
%
%    6. Display Compression Numbers
%
	semilogy(bbwp,'r:'); 
	axis([0 500 10^(ymin) 10^(ymax)])
	hold on;
	semilogy(bbcp,'g-.'); 
	h = text(350,10^(ymax-.5) ,'BBCP -.'); set(h,'Color','Green');
	h = text(350,10^(ymax-1.0) ,'BBWP ..'); set(h,'Color','Red');
	h = text(350,10^(ymax-1.5),'MPCP - '); set(h,'Color','Blue');
	h = text(350,10^(ymax-2.0),'MPWP --'); set(h,'Color','Yellow');
	title(['Compression Numbers: ' Title ]);
	xlabel('m, number of coefficients retained'); 
	ylabel('c_m, (reconstruction error)^2')
	hold off;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
