% BBWork03 -- Ilustrate Tiling <--> Tree Correspondence, WP Dict;
%  Wavelet Packet Dictionary, n=64
%
	n = 64;
	L = 6;
	figure;
%
	tree = zeros(1,2^(L+1));
	ntree = tree + 1;
	wp = zeros(n,L);
%
	subplot(2,2,1)
	PlotBasisTree(tree,6,ntree,'Empty Tree')
	subplot(2,2,2)
	PlotPhaseTiling('WP',tree,wp,'WP; Dirac Basis','-')
%
	wtree = zeros(1,2^(L+1));
	for d=0:(L-2)
		wtree(node(d,0)) = 1;
	end
%
	ntree = wtree;
%
	subplot(2,2,3)
	PlotBasisTree(wtree,6,ntree,'Left-Leaning Tree')
	subplot(2,2,4)
	PlotPhaseTiling('WP',wtree,wp,'WP; Wavelet Basis','-')
	
%
	ifprint(gcf,'bbfig031.ps')
%
	figure;
%
	ftree = zeros(1,2^(L+1));
	
	ftree(1:2^L-1) = ones(1,2^L-1);
	ntree = zeros(1,2^(L+1)); a = 0;
	for d=L:-1:0,
		ntree(node(d,0):node(d,2^d-1)) = ones(1,2^d) .* a;
		a = 2*a+1;
	end
	wp = zeros(n,L);
%
	subplot(2,2,1)
	PlotBasisTree(ftree,6,ntree,'Complete Tree')
	subplot(2,2,2)
	PlotPhaseTiling('WP',ftree,wp,'WP; Quasi Fourier Basis','-')
%
	gtree = zeros(1,2^(L+1));
	ell   = 3;
	gtree(1:(2^ell-1)) = ones(1,2^ell-1);
	ntree = zeros(1,2^(L+1)); a = 0;
	for d=ell:-1:0,
		ntree(node(d,0):node(d,2^d-1)) = ones(1,2^d) .* a;
		a = 2*a + 1;
	end
	for d=ell+1:L,
		ntree(node(d,0):node(d,2^d-1)) = ones(1,2^d) .* a;
	end
%
	subplot(2,2,3)
	PlotBasisTree(gtree,6,ntree,'Partial Complete Tree')
	subplot(2,2,4)
	PlotPhaseTiling('WP',gtree,wp,'WP; Quasi Gabor Basis','-')
	
%
	ifprint(gcf,'bbfig032.ps')
%
	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
