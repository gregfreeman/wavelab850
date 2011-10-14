function do_shrinkage
% do_shrinkage -- Called by WLBrowser
%  Usage
%    do_shrinkage
%

do_global;

figure(fig_hand1); clf;
if noise_type > 0 & abs(namp) > 1.0e-12 

  subplot(611)
  st = ['Signal: ' signal_name ...
     '; N: ' int2str(length(x_signal)) ];
  plot(x_signal,'-y');
  title(st)

  subplot(612)
  st = 'Noise';
  if isempty(x_noise)
      disp('Please add noise to the signal first');
      return
  end
  
  plot( x_noise,'-r')
   title(st)

  subplot(613)
  plot( x_use,'-b')
  st = [ 'Signal + Noise' ];
  title(st)

else
  subplot(211)
  st = ['Signal: ' signal_name ...
     '; N: ' int2str(length(x_signal)) ];
  plot(x_use,'-y');

end

v = axis;v(2) = n;axis(v);
title( st )
drawnow

%.........................................
disp(' ')
disp('%**********************************')
disp('%   Do FORWARD WAVELET TRANSFORM  *')
disp('%**********************************')
disp(' ')
ld = 3;
if filter_type == 1
  % 'Haar'
 QMF_Filter = MakeONFilter('Haar', 1);
 disp([ 'QMF = MakeONFilter(''Haar '', 1);' ] )

  wc = FWT_PO( x_use, ld, QMF_Filter);
  disp('wc = FWT_PO( x_use, ld, QMF);')

elseif filter_type == 2
  % 'Daubechies'
  Par = 3;
  disp('Par = 3;')
  size( x_use )
  ld
  Par
   wc = FWT_CDJV( x_use, ld, Par );
  disp('wc = FWT_CDJV( x_use, ld, Par );')
  size( wc )
  max(wc )
  ld

elseif filter_type == 3
  % AI
  D = 2;
  disp('D = 2;')

  aif = MakeAIFilter( D );
  disp('aif = MakeAIFilter( D );')

  edf = MakeAIBdryFilter( D );
  disp('edf = MakeAIBdryFilter( D );')

  wc = FWT_AI( x_use, ld, D, aif, edf);
  disp('wc = FWT_AI( x_use, ld, D, aif, edf);')

elseif filter_type == 4
  %'Coiflet';
  Par = 2;
  disp('Par = 2;')

  QMF_Filter = MakeONFilter('Coiflet',Par);
  disp(['QMF = MakeONFilter(''Coiflet'',Par);'])

  wc = FWT_PO( x_use, ld, QMF_Filter);
  disp('wc = FWT_PO( x_use, ld, QMF);')


elseif filter_type == 5
  %'Symmlet';
  Par = 6;
  disp('Par = 6;')

  QMF_Filter = MakeONFilter('Symmlet',Par);
  disp([ 'QMF = MakeONFilter(''Symmlet'',Par);' ])

  wc = FWT_PO( x_use, ld, QMF_Filter);
  disp('wc = FWT_PO( x_use, ld, QMF);')

end

  figure( fig_hand2 ); clf;
  subplot(211);

  PlotWaveCoeff( wc, ld, 0 );
  disp([ 'PlotWaveCoeff( wc, ld, 0 );'] )

  title('Before')
  disp([ 'title(''Before'')' ] )
  drawnow
  nx = length( x_use );

disp(' ')
disp('%**********************************')
disp('%      Do SHRINKAGE OPERATION     *')
disp('%**********************************')
disp(' ')

if shrinkage_type == 1
  wc((2^(ld)+1):nx) = VisuThresh(wc((2^(ld)+1):nx)) ;
  disp('c((2^(ld)+1):nx) = VisuThresh(wc((2^(ld)+1):nx));')

elseif shrinkage_type == 2
 wc = MultiSURE(wc,ld);
 disp('wc = MultiSURE(wc,ld);')

elseif shrinkage_type == 3
  wc = MultiHybrid(wc,ld);
  disp('wc = MultiHybrid(wc,ld);')

elseif shrinkage_type == 4
  wc = MultiMAD(wc,ld);
  disp('wc = MultiMAD(wc,ld);')

elseif shrinkage_type == 5
  wc((2^(ld)+1):nx) = MinMaxThresh(wc((2^(ld)+1):nx)) ;
  disp('wc((2^(ld)+1):nx) = MinMaxThresh(wc((2^(ld)+1):nx)) ;')

elseif shrinkage_type == 6
  bell = 'Sine';
  disp('bell = ''Sine'';')

  D = 10;
  disp('D = 10;')

  [clean,bb,st] = WPDeNoise(x_use,D,QMF_Filter);
  disp('[clean,bb,st] = WPDeNoise(x_use,D,QMF);')

elseif shrinkage_type == 7
  bell = 'Sine';
  disp('bell = ''Sine'';')

  D = 10;
  disp('D = 10;')

  [clean,bb,st] = CPDeNoise(x_use,D,bell);
  disp('[clean,bb,st] = CPDeNoise(x_use,D,bell);')


end

%*********************************
%  Now Display the Coefficients  %
%*********************************
  if shrinkage_type < 6
   scale_2 = 0 * max(abs( wc ) );
   disp('scale_2 = 0 * max(abs( wc ) );')
   figure( fig_hand2 );
   subplot(212);
   PlotWaveCoeff( wc, ld, scale_2 );
   disp('PlotWaveCoeff( wc, ld, scale_2 );')
   title('AFTER')
   drawnow
  else
    disp('to be added: display best basis tree')
  end

disp(' ')
disp('%**********************************')
disp('%   Do INVERSE WAVELET TRANSFORM  *')
disp('%**********************************')
disp(' ')

  if shrinkage_type < 6

    if filter_type == 1
      xhat = IWT_PO( wc, ld, QMF_Filter );
      disp('xhat = IWT_PO( wc, ld, QMF );')

    elseif filter_type == 2
      % 'Daubechies'
      xhat = IWT_CDJV( wc, ld, Par );
      disp('xhat = IWT_CDJV( wc, ld, Par );')

    elseif filter_type == 3
       % AI
       xhat = IWT_AI( wc, ld, D, aif, edf);
       disp('xhat = IWT_AI( wc, ld, D, aif, edf);')

    elseif filter_type == 4
      %'Coiflet';
     xhat = IWT_PO( wc, ld, QMF_Filter );
     disp('xhat = IWT_PO( wc, ld, QMF );')

    elseif filter_type == 5
      %'Symmlet';
     xhat = IWT_PO( wc, ld, QMF_Filter );
     disp('xhat = IWT_PO( wc, ld, QMF );')

    end
  else
    xhat = clean;
  end

figure( fig_hand1 )
subplot(212)
plot(xhat ,'-b')
if noise_type > 0
   hold on;plot( xhat - x_signal,'-r');hold off
end
v = axis;v(2) = n;axis(v);

title( 'DeNoised Data (blue); Error (red)')
drawnow

%+++++++++++++++++++++++++++++++++++++++++
%  Compute and Plot the Power Spectra of  +
%    the data and de-noised version       +
%------------------------------------------

 figure( fig_hand3 ); clf;
  subplot(111);
  semilogy( wl_spectrum( x_use, n/2 ), '-g')
  hold on
  semilogy( wl_spectrum(  xhat, n/2 ), '-r')
  hold off
  ylabel('Power')
  xlabel('Frequency')
  title('Power Spectra: Data (green) DeNoised (red)')
%.........................................

disp([ 'Done processing: ' signal_name ])
disp(['======================================'])


%  Revision History
%             10/1/05     AM     the name of the variable QMF is changed to
%                                 QMF filter

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
