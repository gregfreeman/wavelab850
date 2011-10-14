function fldx = FoldMeyer(x,sympts,polarity,window,deg)
% FoldMeyer -- Fold a vector onto itself using a specified window
%  Usage
%    fldx = FoldMeyer(x, sympts, polarity, window,deg)
%  Inputs
%    x         signal vector in frequency domain 
%                 (typically of length n=2^J)
%    sympts    symmetry points, of the form [a,b]
%    polarity  string selection folding polarity
%                 ' mp  =>  (-,+) '
%                 ' pm  =>  (+,-) '
%                 ' mm  =>  (-,-) '
%                 ' pp  =>  (+,+) '
%    window    string selecting window
%                 'm' => Mother Meyer Wavelet Window
%                 't' => Truncated Mother Meyer Wavelet Window
%                 'f' => Father Meyer Wavelet Window
%    deg       degree of Meyer window
%
%  Outputs 
%    fldx      folded version of x. Supported on interval [sympts(1),sympts(2)]
%
%  See Also
%    WindowMeyer, CoarseMeyerCoeff, DetailMeyerCoeff, FineMeyerCoeff
% 

pio2 = pi/2;

% **  Window 'x' with the specified window.

	if (window == 'm') ,
	  eps    = floor(sympts(1)/3);
	  epsp   = sympts(1) - eps - 1;
	  lftind  = [ sympts(1)-eps+1 : sympts(1) ];
	  lmidind = [ sympts(1)+2 : sympts(1)+eps+1 ];
	  rmidind = [ sympts(2)-epsp+1 : sympts(2) ];
	  rghtind = [ sympts(2)+2 : sympts(2)+epsp+1 ];
	  lft  = x(lftind).*sin(pio2*WindowMeyer(3*((lftind-1)/sympts(2))-1,deg));
	  lmid = x(lmidind).*sin(pio2*WindowMeyer(3*((lmidind-1)/sympts(2))-1,deg));
	  rmid = x(rmidind).*cos(pio2*WindowMeyer((3/2)*((rmidind-1)/sympts(2))-1,deg));
	  rght = x(rghtind).*cos(pio2*WindowMeyer((3/2)*((rghtind-1)/sympts(2))-1,deg));
	
	elseif (window == 'f') ,
	  n      = length(x);
	  eps    = floor(sympts(2)/3);
	  lftind  = [ n + sympts(1) - eps + 1: n + sympts(1) ];
	  lmidind = [ n + sympts(1) + 2 : n + sympts(1) + eps + 1 ];
	  cntrind = [ [n + sympts(1)+ eps + 2: n] [ 1 : sympts(2) -  eps ]  ];
	  rmidind = [ sympts(2) - eps + 1: sympts(2) ];
	  rghtind = [ sympts(2) + 2: sympts(2) + eps + 1 ];
	  lft  = x(lftind).* ...
			 cos(pio2*WindowMeyer(3*(abs(lftind-n-1)/(2*sympts(2))) - 1,deg));
	  lmid = x(lmidind).* ...
			 cos(pio2*WindowMeyer(3*(abs(lmidind-n-1)/(2*sympts(2)))-1,deg));
	  cntr = x(cntrind);
	  rmid = x(rmidind).* ...
			 cos(pio2*WindowMeyer(3*((rmidind-1)/(2*sympts(2)))-1,deg));
	  rght = x(rghtind).* ...
			 cos(pio2*WindowMeyer(3*((rghtind-1)/(2*sympts(2)))-1,deg));
	
	elseif (window == 't') ,
	  eps    = floor(sympts(1)/3);
	  epsp   = sympts(1) - eps - 1;
	  lftind  = [ sympts(1)-eps+1 : sympts(1) ];
	  lmidind = [ sympts(1)+2 : sympts(1)+eps+1 ];
	  rmidind = [ sympts(2)-epsp+1 : sympts(2) ];
	  lft  = x(lftind).*sin(pio2*WindowMeyer(3*((lftind-1)/sympts(2))-1,deg));
	  lmid = x(lmidind).*sin(pio2*WindowMeyer(3*((lmidind-1)/sympts(2))-1,deg));
	  rmid = x(rmidind);
	  rght = zeros(1,length(rmidind));
	else 
	  ' Either the mother or truncated mother Meyer wavelets '
	  ' must be used with the polarity chosen.               '
	end


%** Fold according to the specified polarity.

	if (polarity == 'mp') ,
	  fldx =  [ -fliplr(lft)   fliplr(rght)      0        ] ...
			+ [     lmid          rmid     x(sympts(2)+1) ];
	elseif (polarity == 'pm') ,
	  fldx =  [      0         fliplr(lft)  -fliplr(rght) ] ...
			+ [ x(sympts(1)+1)    lmid          rmid      ];
	elseif (polarity == 'pp') ,
	  fldx =  [ x(n+sympts(1)+1) lmid cntr rmid x(sympts(2)+1) ] ...
			+ [ 0 fliplr(lft) zeros(1,length(cntrind)) fliplr(rght) 0 ];
	elseif (polarity == 'mm') ,
	  fldx   =  [ lmid    cntr     rmid  ] ...
			  + [ -fliplr(lft) zeros(1,length(cntrind)) -fliplr(rght)  ];
	else 
	  'Polarity convention must be one of the following !'
	  ' mp  =>  (-,+) '
	  ' pm  =>  (+,-) '
	  ' mm  =>  (-,-) '
	  ' pp  =>  (+,+) '
	end
	

%
%  Prepared for the thesis of Eric Kolaczyk, Stanford University, 1994
%  Copyright (c) Eric Kolaczyk, 1994.
%
 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
