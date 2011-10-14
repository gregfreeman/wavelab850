function btree = MakeBasis(n,btype,par)
% MakeBasis -- Create a basis tree for a standard basis
%  Usage
%    btree = MakeBasis(n,btype,par)
%  Inputs
%    n        dimension of basis
%    btype    string, one of 'Dirac', 'QuasiDCT', 'Gabor' or 'Wavelet'
%    par      if 'Gabor', which splitting level
%  Outputs
%    btree    basis tree, as produced by BestBasis, for example
%
%  Description
%    The 'Dirac' basis corresponds to the original signal in the wavelet
%    packets table, and to the Fourier transform of the signal in the cosine
%    packets table.  In either case, no splitting is performed.
%
%    'QuasiDCT' refers to complete splitting (i.e. the last row) in the
%    wavelet packets table.  This splitting is done in frequency, hence the
%    name 'QuasiDCT.'
%
%    'Gabor' refers to equal splitting, left and right, up to a certain row
%    in either the wavelet or cosine packets table.
% 
%    'Wavelet' corresponds to the standard wavelet basis in the wavelet
%    packets table, i.e. continued splitting of the low-pass output.
%
%
%  See Also
%    BestBasis, PlotBasisTree
%

	btree = zeros(1,2*n-1);

	if strcmp(btype,'Dirac'),
		% don't need to do anything
		
	elseif strcmp(btype,'QuasiDCT'),
		btree(1:(n-1)) = ones(1,n-1);
		
	elseif strcmp(btype,'Gabor'),
		btree(1:(2^par-1)) = ones(1,2^par-1);
		
	elseif strcmp(btype,'Wavelet'),
		for d=0:(log2(n)-1),
			btree(node(d,0)) = 1;
		end
	
    else
         disp('in MakeBasis: unknown basis request')
         fprintf('Request=<<%s>>\n',btype)
         disp('I only know how to do:')
         disp(' Dirac, QuasiDCT, Gabor, Wavelet ')
    end

%
% Copyright (c) 1995.  Jonathan Buckheit
%
    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
