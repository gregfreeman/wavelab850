function do_spectrum
% do_spectrum -- Called by WLBrowser
%  Usage
%    do_spectrum
%  Inputs
%    none
%  Outputs
%    none
%
%  Description
%    The conventional Fourier power spectrum of the working data
%    is computed and plotted.
%
%  Side Effects
%    Power spectrum is computed and plotted.


m=2;st='Spectrum';setfigure;
[ ndum, L ] = dyadlength( QMF_Filter );
[   nx, J ] = dyadlength( x_work );

L_use = L - 1;
  if L_use < 1
    L_use = 1;
  end

wc = FWT_PO( x_work, L_use, QMF_Filter );

for i = L:J-1
  sg(i-L+1) = mean( ( wc(dyad(i)) ).^2);
end
nsp = length( x_work )/2;
sp = wl_spectrum( x_work, nsp );
sg = reverse( sg );
sp = reverse( sp )/sqrt(nx);
tsg = 2 .^ ( (L:J-1)-1);
tsp = 1:nsp;

plot( ...
    tsp, log10(sp),'-g', ...
    tsg, log10(sg),'-r', ...
    tsg, log10(sg),'xb' )
signaltitle = [ 'Spectrum (green) & Scalegram (red) : ' signal_name ];
title( signaltitle)
xlabel('Frequency')
ylabel('log10(Power)')
    
%  Revision History
%             10/1/05     AM     the name of the variable QMF is changed to
%                                 QMF filter


 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
