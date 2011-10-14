% def_signal -- Called by WLBrowser
%  Usage
%    def_signal
%

function x = def_signal(i)

do_global; global nsig;

signal_name = Signals_entries( i,: );
while signal_name( length(signal_name) ) == ' '
   signal_name( length(signal_name) ) = [];
end


  if ~exist('nsig') | nsig == [] | nsig == 0
    nsig = 2^8;
  end
  x = MakeSignal(signal_name, nsig );

 [ aa bb ] = size(x);
  if aa > bb
    x = x';
  end
  x = ...
   x(1:2^(fix(log(length(x))/log(2) ))); 

  x_signal = x;
  if max( abs(x_noise) ) > 0 
    x_use = x_signal + x_noise;
  else
    x_use = x_signal;
  end
  n =length(x_use) 
  plot_new_data;


    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
