function unfldx = UnfoldMeyer(x,sympts,polarity,window,deg)
% UnfoldMeyer -- Unfold a vector using a specified window.
%  Usage
%    unfldx = UnfoldMeyer(x, sympts, polarity, window,deg)
%  Inputs
%    fldx     folded version of x. Supported on interval [sympts(1),sympts(2)]
%                (typically of length n=2^j for some j)
%    sympts    symmetry points, of the form [a,b]
%    polarity  string selection folding polarity
%                      ' mp  =>  (-,+) '
%                      ' pm  =>  (+,-) '
%                      ' mm  =>  (-,-) '
%                      ' pp  =>  (+,+) '
%    window    string selecting window
%                      'm' => Mother Meyer Wavelet Window
%                      't' => Truncated Mother Meyer Wavelet Window
%                      'f' => Father Meyer Wavelet Window
%    deg       degree of Meyer window
%
%  Outputs 
%    unfldx    unfolded version of x. Extended outside interval [sympts(1),sympts(2)]
%              using the selected polarity and window
%  See Also
%    WindowMeyer, CoarseMeyerProj, DetailMeyerProj, FineMeyerProj
% 

	pio2 = pi/2;

% **  Choices are broken down by window, and polarity within window.

	if (window == 'm') ,
	  eps    = floor(sympts(1)/3);
	  epsp   = sympts(1) - eps - 1;
	  if ( polarity == 'mp' ),
		xi    = ((sympts(1)+1 ):(sympts(2)) ) ./ sympts(2);
		lft  = x(1:eps) .* cos(pio2*WindowMeyer(3*xi(1:eps)-1,deg));
		lmid = x(1:eps) .* sin(pio2*WindowMeyer(3*xi(1:eps)-1,deg));
		rmid = x(eps+1:eps+epsp) .* ...
			   cos(pio2*WindowMeyer(1.5*xi(eps+1:eps+epsp)-1,deg));
		rght = x(eps+1:eps+epsp) .* ...
			   sin(pio2*WindowMeyer(1.5*xi(eps+1:eps+epsp)-1,deg));
		unfldx = [ -fliplr(lft) 0 lmid rmid x(sympts(1)) fliplr(rght) ];
	  elseif ( polarity == 'pm' ),
		xi    = ((sympts(1) ):(sympts(2)-1) ) ./ sympts(2);
		lft  = x(2:eps+1) .* cos(pio2*WindowMeyer(3*xi(2:eps+1)-1,deg));
		lmid = x(2:eps+1) .* sin(pio2*WindowMeyer(3*xi(2:eps+1)-1,deg));
		rmid = x(eps+2:eps+epsp+1) .* ...
			   cos(pio2*WindowMeyer(1.5*xi(eps+2:eps+epsp+1)-1,deg));
		rght = x(eps+2:eps+epsp+1) .* ...
			   sin(pio2*WindowMeyer(1.5*xi(eps+2:eps+epsp+1)-1,deg));
		unfldx = [ fliplr(lft) x(1) lmid rmid  0 -fliplr(rght) ];
	  end
	
	elseif (window == 'f') ,
	  n       = length(x);
	  eps     = floor(sympts(2)/3) ;
	  innerx  = ((sympts(2)-eps):(sympts(2)-1))./ (2*sympts(2)) ;
	  outerx  = ((sympts(2)+1):(sympts(2)+eps))./ (2*sympts(2)) ;
	  if ( polarity == 'pp' ),
		lft  = fliplr(x(2:(eps+1))).* ...
			   cos(pio2*WindowMeyer(3*fliplr(outerx)-1,deg));
		lmid = x(2:(eps+1)) .* ...
			   cos(pio2*WindowMeyer(3*fliplr(innerx)-1,deg));
		rmid = x(2*sympts(2)-eps+1:2*sympts(2)) .* ...
			   cos(pio2*WindowMeyer(3*innerx-1,deg));
		rght = fliplr( x(2*sympts(2)-eps+1:2*sympts(2)) ) .* ...
			   cos(pio2*WindowMeyer(3*outerx-1,deg));
		unfldx = [ lft  x(1)  lmid  x((2+eps):(2*sympts(2)-eps)) ...
				   rmid  x((2*sympts(2)+1))  rght ];
	  elseif ( polarity == 'mm' ),
		lft  = fliplr(x(1:eps)) .* ...
			   cos(pio2*WindowMeyer(3*fliplr(outerx)-1,deg));
		lmid = x(1:eps) .* ...
			   cos(pio2*WindowMeyer(3*fliplr(innerx)-1,deg));
		rmid = x(2*sympts(2)-eps:2*sympts(2)-1) .* ...
			   cos(pio2*WindowMeyer(3*innerx-1,deg));
		rght = fliplr( x(2*sympts(2)-eps:2*sympts(2)-1) ) .* ...
			   cos(pio2*WindowMeyer(3*outerx -1,deg));
		unfldx = [ -lft 0 lmid x(eps+1:2*sympts(2)-eps-1) rmid 0 -rght ];
	  end
	
	elseif (window == 't') ,
	  eps    = floor(sympts(1)/3);
	  epsp   = sympts(1) - eps - 1;
	  if ( polarity == 'mp' ),
		xi = ((sympts(1)+1):sympts(2) ) ./ sympts(2) ;
		lft  = x(1:eps) .* cos(pio2*WindowMeyer(3*xi(1:eps)-1,deg));
		lmid = x(1:eps) .* sin(pio2*WindowMeyer(3*xi(1:eps)-1,deg));
		rmid = x(eps+1:eps+epsp);
		unfldx = [ -fliplr(lft) 0 lmid rmid x(eps+epsp+1)*sqrt(2)];
	  elseif ( polarity == 'pm' ),
		xi    = ((sympts(1) ):(sympts(2)-1) ) ./ sympts(2);
		lft  = x(2:eps+1) .* cos(pio2*WindowMeyer(3*xi(2:eps+1)-1,deg));
		lmid = x(2:eps+1) .* sin(pio2*WindowMeyer(3*xi(2:eps+1)-1,deg));
		rmid = x(eps+2:eps+epsp+1);
		unfldx = [ fliplr(lft) x(1) lmid rmid 0 ];
	  end
	else 
	  ' Either the mother or truncated mother Meyer wavelets '
	  ' must be used with the polarity chosen.               '
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
