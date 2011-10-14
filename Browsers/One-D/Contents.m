% Browsers/One-D:Contents v850 -- 1-d Signal Browser
%
% The routines in this directory implement a point-and-click browser that
% allows the user to select signals, select wavelet, wavelet packet,
% discrete cosine transforms, etc.  Some of the options, including
% WTCompress, WPCompress and CPCompress contain other possibilities for
% interaction, such as interactive wavelet thresholding -- changing a
% threshold interactively and watching the effects upon reconstruction.
%
% Invoke this browser via the command
% 
%    WLBrowser
%  
% Upon initialization, four new figure windows will tile the screen and
% several menu items will appear at the top of the figure window at the
% upper left of the screen:
%
%    File Edit Window *Data *Signal *Transform *Options *Action
%
% The starred items are the ones supplied by the browser.  If you click
% the mouse button while pointing at the *Data item, a pull-down menu
% will appear with the names of datasets, etc.  In this way, by point and
% click operations, you can select wavelet types, transform types, and
% immediately see the results of such operations.
%
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
