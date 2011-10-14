function extproj = ExtendProj(proj,n,window,sympts,sym)
% ExtendProj -- Extend a projection to all of the integers -n/2+1 -> n/2
%  Usage
%    extproj = ExtendProj(proj,n,window,sympts,sym)
%  Inputs
%    proj     windowed projection vector
%    n        length of full signal
%    window   string selecting window used in windowing projection
%             'm' -> mother, 'f' -> father, 't' -> truncated mother
%    sympts   points of symmetry and antisymmetry of projection
%    sym      string: symmetry type; 'e' -> even ;'o' -> odd
%  Outputs
%    extproj extended projection of length n
%
% See Also
%    CoarseMeyerProj, DetailMeyerProj, FineMeyerProj
%

	if ( window == 'm' ),
	  nj = sympts(2);
	  frontlength = nj/4 + floor(nj/12) + 1;
	  backlength  = n/2 - (nj + floor(nj/3) );
	  pospart = [ zeros(1,frontlength) proj zeros(1,backlength) ];
	elseif ( window == 'f' ),
	  frontind = [(length(proj)+1)/2:length(proj)];
	  backlength = n/2 + 1 - length(frontind);
	  pospart = [ proj(frontind) zeros(1,backlength) ];
	elseif ( window == 't' ),
	  nj1 = sympts(1);
	  frontlength = n/2 - ( nj1 + floor(nj1/3) );
	  pospart = [ zeros(1,frontlength) proj ];
	else 
	'Window not of type m, f, or t !'
	end
	
	if ( sym == 'e' ),
	  extproj = [  pospart  fliplr(pospart(2:n/2)) ];
	elseif ( sym == 'o' ),
	  extproj = [  pospart -fliplr(pospart(2:n/2)) ];
	else
	'Even (e) or Odd (o) are the only symmetry choices !'
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
