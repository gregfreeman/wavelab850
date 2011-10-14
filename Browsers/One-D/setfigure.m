function setfigure
% setfigure -- Called by WLBrowser
%  Usage
%    setfigure
%  Inputs
%    none
%  Outputs
%    none
%
%  Description
%    The figure and title indicated are reset.  The figure to be
%    reset is indicated by the global variable m.
%
%  Side Effects
%    Figure is reset
%
if fig_handle(m) == 0
  figure;
  fig_handle(m) = gcf;
else
  figure( fig_handle(m) );
end

signaltitle = [ st ': ' signal_name ];
set( gcf, 'Name', signaltitle );
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
