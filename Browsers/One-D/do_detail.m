function do_detail
% do_detail -- Called by WLBrowser
%  Usage
%    do_detail
%  Inputs
%    none
%  Outputs
%    none
%
%  Description
%    The detail at a given scale is just the
%    contribution to the wavelet expansion
%    at that scale.  It is obtained from 
%    summing the wavelet coefficients times
%    the wavelets at a given scale.
%
%  Side Effects
%    Compute and display the detail 
%    (wavelet coefficient x wavelet shape) 
%    as a function of scale.
%
if fig_hand2 == 0
  fig_hand2 = 3;
  figure(fig_hand2);
else
  figure(fig_hand2);
end

signaltitle = [' Detail: ' signal_name ];

set( fig_hand2, 'Name', signaltitle );
[ndum,L] = dyadlength(QMF_Filter);
[nx, J] = dyadlength(x_use);

wc = FWT_PO( x_use,L,QMF_Filter);
wtmat = zeros(J-L,nx);
for i = L:J-1
  wt = zeros(1,n);
  wt(dyad(i)) = wc( dyad(i) );
  wtmat(J-1,:) = IWT_PO(wt,L,QMF_Filter);
end
pcolor(wtmat)
shading('interp')
colormap('hsv')
title( signaltitle)

%  Revision History
%             10/1/05     AM     Changing the name of the variable QMF

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
