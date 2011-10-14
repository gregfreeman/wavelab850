function reset_slider
% reset_slider -- Called by WLBrowser
%  Usage
%    reset_slider
%  Inputs
%    none
%  Outputs
%    none
%
%  Description
%  This routine resets the state and parameters of the slider.
%  Side Effects
%    Slider is reset.

if n_work == n_use
  set(HC,'Visible','off');
else
  set(HC,'Visible','on');
  slide_max = (n_use - n_work)/n_use;
  slide_val = (offset/(n_use))/slide_max;
  set(HC,'pos',[.02,y_sli, slide_max,.05]);
  set(HC,'value',slide_val);
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
