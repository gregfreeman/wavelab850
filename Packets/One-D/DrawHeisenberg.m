function DrawHeisenberg(x0,x1,y0,y1,v)
% DrawHeisenberg -- Draw Heisenberg rectangle
%  Usage
%    DrawHeisenberg(x0,x1,y0,y1,v)
%  Inputs
%    x0,x1,y0,y1    coordinates of rectangle
%    v              value determining how rectangle is plotted
%                   v < 3 invisible
%                   v > 3 visible
%                   3 < v <= 5   '.'
%                   5 < v <= 10  'o'
%                   10 < v       'x'
%
%  Description
%    This is a utility employed by PlotPhasePlane.
%
%  See Also
%    PlotPhasePlane, CPTour, WPTour
%

	if( v > 3)
		plot([x0 x1 x1 x0 x0], [y0 y0 y1 y1 y0])
	end 
	if( v > 3 & v <= 5), 
		 plot( (x0+x1)/2, (y0+y1)/2, '.')
	else
		 if( v > 5 & v <= 10),
			 plot( (x0+x1)/2, (y0+y1)/2, 'o')
		  else
			 if( v > 10),
					plot( (x0+x1)/2, (y0+y1)/2, 'x')
			 end
		  end
	   end
	
%
% Copyright (c) 1993. David L. Donoho
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
