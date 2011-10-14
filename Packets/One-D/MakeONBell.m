function [bp,bm] = MakeONBell(Name,m)
% MakeONBell -- Make Bell for Orthonormal Local Cosine Analysis
%  Usage
%    [bp,bm] = MakeONBell(bell,m)
%  Inputs
%    bell      bellname, currently 'Trivial','Sine'
%    m         length of bell
%  Outputs
%    bp        part of bell interior to domain
%    bm        part of bell exterior to domain
%
% See Also
%    CPAnalysis, CPSynthesis, MakeCosinePacket
%

	xi = (1 + (.5:(m-.5))./m)./2;
	if strcmp(Name,'Trivial'),
	   bp = sqrt(xi);
	elseif strcmp(Name,'Sine'),
	   bp = sin( pi/2 .* xi );
	end
	bm = sqrt(1 - bp .^2); 

%
% Copyright (c) 1993. David L. Donoho
%     
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
