function DisplayWaveCoeff(wc,L,scal,type,num_use)
% DisplayWaveCoeff -- Display wavelet coefficients
%  Usage
%    DisplayWaveCoeff(wc,L,scal,type[,num_use])
%  Inputs
%    wc        1-d wavelet transform
%    L         level of coarsest scale
%    scal      scale factor [0 ==> autoscale]
%    type      'Mesh','Contour','Image'
%    num_use   for Contour only, number of contours to plot (def. 8)
%
%  Side Effects
%    A display of wavelet coefficients (coarsest level NOT
%    included) by level and position.
%
%  See Also
%    PlotMultiRes, FWT_PO, IWT_PO, PlotSpikes
%

if nargin < 5
  num_use = 8;
end

    wavecoef = ShapeAsRow(wc);
	[n,J] = dyadlength(wavecoef); 
	if scal==0, 
		scal = 1. / max(abs(wavecoef((2^(L)+1):n))); 
	end
%
    num_levels = J - L;
    display_array = zeros(num_levels,n);

%
	for j=(J-1):-1:L
	  temp = wavecoef(dyad(j)).*scal;
          num_copies = n / (2^j);
          temp = ones(num_copies,1) * temp;
          [ aa bb ] = size(temp);
          temp = reshape( temp, 1, aa*bb );
          display_array( j, : ) = temp;
	end
%
    log_thresh = 0.01;

    d_max = max(max( display_array ));
    d_min = min(min( display_array ));
    display_array = 255*( display_array - d_min ) / (d_max - d_min);
%   d_max = max(max( display_array ));
%   d_min = min(min( display_array ));
%   disp(['Max: ' num2str(d_max) '; Min: ' num2str(d_min)])
    display_array = abs(flipud( display_array ));

    if strcmp(type, 'Mesh')
       mesh( display_array );
       shading flat
       colormap(gray)
    elseif strcmp(type, 'Contour')
       contour( display_array, num_use )
    elseif strcmp(type, 'Image')
        pcolor( display_array )
        shading flat
        colormap(gray)
    else
        disp('Only allowed types are Mesh, Contour and Image')
    end

%
% Copyright (c) 1993. David L. Donoho and Jeffrey D. Scargle
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
