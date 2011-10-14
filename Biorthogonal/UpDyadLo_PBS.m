function y = UpDyadLo_PBS(x,qmf)
% UpDyadLo_PBS -- Lo-Pass Upsampling operator; periodized
%  Usage
%    u = UpDyadLo_PBS(d,sf)
%  Inputs
%    d    1-d signal at coarser scale
%    sf   symmetric filter
%  Outputs
%    u    1-d signal at finer scale
%
%  See Also
%    DownDyadLo_PBS , DownDyadHi_PBS , UpDyadHi_PBS, IWT_PBS, symm_iconv
%
	y =  symm_iconv(qmf, UpSampleN(x) );

%
% Copyright (c) 1995. David L. Donoho
%     
%  Revision History
%  10/1/05       AM      UpSample is changed to UpSampleN
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
