function do_scalogram
% do_scalogram -- Called by WLBrowser
%  Usage
%    do_scalogram
%  Inputs
%    none 
%  Outputs
%    none
%
%  Description
%    Compute the log (base 10) of the wavelet coefficients
%    and plot the results as an image.
%
%  Side Effects
%    Scalogram is computed and plotted.

m=2;st='Scalogram';setfigure;
[ ndum, L ] = dyadlength( QMF_Filter );
[   nx, J ] = dyadlength( x_use );

wc = FWT_PO( x_use, L, QMF_Filter );
clear sgmat

for i = L:J-1
  wt = wc( dyad(i) );
  nnn = fix( nx / length(wt ) );
  tem = [];
  for mm = 1:nnn
    tem = [ tem; wt ];
  end
  sgmat(J-i, : ) = 2*log10( ...
    abs( reshape(tem,1,nx) ) / length(wt) ...
                          );
end
pcolor(sgmat);shading('interp');colormap(hsv);
title([ 'Scalogram of: ' signal_name]  )
    
%  Revision History
%             10/1/05     AM     the name of the variable QMF is changed to
%                                 QMF filter

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
