function x = def_noise(kk)
% def_noise -- Called by WLBrowser
%  Usage
%    x = def_noise(kk)
%  Inputs
%    kk      type of noise:
%              1   normal
%              2   uniform
%              3   poisson
%

do_global; global h_noimenu

for i=1:3,
   set(h_noimenu(i),'Checked','off')
end
set(h_noimenu(kk),'Checked','on')

  noise_type = kk;

  disp(['Defining noise level: ' num2str(namp) ] )
  if noise_type == 1
    x_noise = namp * randn( size( x_signal ) );

  elseif noise_type == 2
    x_noise = namp * rand( size( x_signal ) );

  elseif noise_type == 3
    x_noise = - ones(size(x_signal) );
    disp(['Poisson noise not implemented yet!'])

  end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
