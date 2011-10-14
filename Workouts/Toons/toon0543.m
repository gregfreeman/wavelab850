% toon0543 -- Data Compression of Ingrid Daubechies
%
%  Investigate Sparsity in the Wavelet Transform of Daubechies.
%
	wcsort = sort(abs(wingrid(:)));
	wcerr  = cumsum(wcsort.^2);
	wcerr  = flipud(wcerr);
%
%  Sparsify Image
%
	wthresh = wcsort(floor(.95*65536));
	cw_ingrid = wingrid .* (abs(wingrid) > wthresh);
	[i,j,s] = find(cw_ingrid);
	sp_ingrid = sparse(i,j,s,256,256);
	spy(sp_ingrid)
	title('Nonzero Pattern in Sparsification of WT[Daubechies]')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
