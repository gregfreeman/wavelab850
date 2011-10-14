function DisplayMultiRes(wc,L,scal,qmf,type)
% DisplayMultiRes -- Multi-Resolution Mesh Display of 1-d Wavelet Transform
%  Usage
%    DisplayMultiRes(wc,L,scal,qmf,type)
%  Inputs
%    wc    1-d wavelet transform
%    L     level of coarsest scale
%    scal  scale factor [0 ==> autoscale]
%    qmf   quadrature mirror filter used to make wc
%    type  'Mesh','Contour','Image'
%
%  Side Effects
%    A depiction of the multi-resolution decomposition
%    of signal, as in S. Mallat.
%
%  See Also
%    PlotWaveCoeff, FWT_PO, IWT_PO, MakeONFilter
%
    wavecoef = ShapeAsRow(wc);
	if scal==0, 
		scal = 1. / max(abs(wavecoef)); 
	end
	
	[n,J] = dyadlength(wavecoef); 
    num_levels = J - L + 1;
    display_array = zeros(num_levels,n);
%
    count = 1;
	w = zeros(1,n);
	w(1:2^(L)) = wavecoef(1:2^(L));
	display_array( count, : ) = scal .* IWT_PO(w,L,qmf);

	for j=(J-1):-1:L
       count = count + 1;
	   w = zeros(1,n);
	   w(dyad(j)) = wavecoef(dyad(j));
	   display_array( count, : ) = scal .* IWT_PO(w,j,qmf);
	end
%
    if strcmp(type, 'Mesh')
       mesh( display_array );
    elseif strcmp(type, 'Contour')
       contour( display_array )
    elseif strcmp(type, 'Image')
        pcolor( display_array )
        shading interp
        colormap(gray)
    else
        disp('Only allowed types are Mesh, Contour and Image')
    end
%
%	xlabel('t'); ylabel('Dyad');
%	title('Multi-Resolution Decomposition');

%
% Copyright (c) 1993. David L. Donoho and Jeffrey D. Scargle
%     
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
