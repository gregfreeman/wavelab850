% def_data -- Called by WLBrowser
%  Usage
%    def_data
%
%  Description
%    Load WaveLab datasets
%

function x = def_data(i)

do_global

data_name = Data____entries( i+1, : );
while data_name( length(data_name) ) == ' '
   data_name( length(data_name) ) = [];
end

if i < 7
  x = ReadSignal(data_name);
  signal_name = data_name;

elseif i == 7
    if exist('kitload')
         load('kitload');
     else
         warndlg('Please save your data as "kitload"');
     end
     
end 

[ aa bb ] = size(x);
if aa > bb
  x = x';
end
x = ...
   x(1:2^(fix(log(length(x))/log(2) ))); 

x_signal = x;

noise_type = 0;
x_noise = zeros( size( x ) );
n = length(x);
x_use = x;
plot_new_data;

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
