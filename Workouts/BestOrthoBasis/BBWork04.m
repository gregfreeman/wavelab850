% BBWork04 -- Ilustrate Tiling <--> Tree Correspondence, CP Dict;
%  Cosine Packet Dictionary, n=64
%
	n = 64;
	L = 8;
	figure;
%
	tree = zeros(1,2^(L+1));
	ntree = tree + 1;
	wp = zeros(n,L);
%
	subplot(2,2,1)
	PlotBasisTree(tree,8,ntree,'Empty Tree')
	subplot(2,2,2)
	PlotPhaseTiling('CP',tree,wp,'CP; Fourier Basis','-')
%
	wtree = zeros(1,2^(L+1));
	for d=0:(L-2)
		wtree(node(d,0)) = 1;
	end
%
	ntree = wtree;
%
	subplot(2,2,3)
	PlotBasisTree(wtree,8,ntree,'Left-Leaning Tree')
	subplot(2,2,4)
	PlotPhaseTiling('CP',wtree,wp,'CP; BlackHole Basis','-')
	
%
	ifprint(gcf,'bbfig041.ps')
%
	figure;
%
	ftree = zeros(1,2^(L+1));
	ell=5;
	ftree(1:2^ell-1) = ones(1,2^ell-1);
	ntree = zeros(1,2^(L+1)); a = 0;
	for d=ell:-1:0,
		ntree(node(d,0):node(d,2^d-1)) = ones(1,2^d) .* a;
		a = 2*a+1;
	end
	for d=ell+1:L,
		ntree(node(d,0):node(d,2^d-1)) = ones(1,2^d) .* a;
	end
	wp = zeros(n,L);
%
	subplot(2,2,1)
	PlotBasisTree(ftree,ell,ntree,'Quasi Complete Tree')
	subplot(2,2,2)
	PlotPhaseTiling('CP',ftree,wp,'CP; Quasi DCT','-')
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
	PlotBasisTree(gtree,ell,ntree,'Partial Complete Tree')
	subplot(2,2,4)
	PlotPhaseTiling('CP',gtree,wp,'CP; Quasi Gabor Basis','-')
	
%
	ifprint(gcf,'bbfig042.ps')
%
	
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
