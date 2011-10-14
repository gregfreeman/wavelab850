function img = MakeImage(Name,n,par)
% MakeImage -- Make artificial 2d signal
%  Usage
%    sig = MakeImage(Name,n[,par])
%  Inputs
%    Name   string, one of:
%      'Backgammon'
%      'BoxWithCross'    (par = length of side [n/2])
%      'Checkerboard'
%      'Circle'          (par = radius [n/4])
%      'FigureEight'
%      'Mondrian'        (par = number [10])		
%      'OvalDiagonal'    (par = major/minor axes ratio [2])
%      'OvalHorizontal'  (par = major/minor axes ratio [2])
%      'OvalVertical'    (par = major/minor axes ratio [2])
%      'StickFigure'
%      'Triangle'
%      'VanishingPoint'
%      'Square'
%    n                   desired signal dimension
%    par                 optional parameter, defaults in []'s above
%  Outputs
%    img                 n by n image
%
	n2 = n/2;
	[x,y] = meshgrid(-n2:n2-1,n2-1:-1:-n2);
		
	if strcmp(Name,'Backgammon'),
		% leftmost diamond
		img = ones(n);
		tmp = makediag(n/2,n/8);
		img(1:n/2,1:n/8) = fliplr(tmp);
		img((n/2+1):n,1:n/8) = rot90(tmp,2);
		img(1:n,(n/8+1):n/4) = fliplr(img(1:n,1:n/8));
		% rightmost diamond
		img(1:n,(n-n/4+1):n) = img(1:n,1:n/4);
		% 2nd diamond
		tmp = makediag(n/2,3*n/32);
		img(1:n/2,(n/4+1):(n/4+3*n/32)) = fliplr(tmp);
		img((n/2+1):n,(n/4+1):(n/4+3*n/32)) = rot90(tmp,2);
		img(1:n,(n/4+3*n/32+1):7*n/16) = fliplr(img(1:n,(n/4+1):(n/4+3*n/32)));
		%4th diamond
		img(1:n,(9*n/16+1):3*n/4) = img(1:n,(n/4+1):7*n/16);
		% middle diamond
		tmp = makediag(n/2,n/16);
		img(1:n/2,(n/2-n/16+1):n/2) = fliplr(tmp);
		img((n/2+1):n,(n/2-n/16+1):n/2) = rot90(tmp,2);
		img(1:n,(n/2+1):(n/2+n/16)) = fliplr(img(1:n,(n/2-n/16+1):n/2));
	
	elseif strcmp(Name,'BoxWithCross'),
		if nargin < 3,
			par = n/2;
		end
		p2 = par/2;
		img =	( x == -p2 & y <= p2 & y >= -p2 ) + ...
				( x ==  p2 & y <= p2 & y >= -p2 ) + ...
			 	( y == -p2 & x <= p2 & x >= -p2 ) + ...
				( y ==  p2 & x <= p2 & x >= -p2 ) + ...
				( y ==  x  & x <= p2 & x >= -p2 ) + ...
				( y == -x  & x <= p2  & x >= -p2 );
		img(find(img > 1)) = ones(size(find(img > 1)));
		
	elseif strcmp(Name,'Checkerboard'),
		img = zeros(n);
		for i=1:n/2,
			img(i,1:i) = ones(1,i);
			img(i,n-i+1:n) = ones(1,i);
			img(n-i+1,1:i) = ones(1,i);
			img(n-i+1,n-i+1:n) = ones(1,i);
		end   
	
	elseif strcmp(Name,'Circle'),
		if nargin < 3,
			par = n/4;
		end
    	img = ( (x-.5).^2 + (y-.5).^2 <= par^2 );
		
	elseif strcmp(Name,'FigureEight'),
		img = ( (x.^2 + y.^2).^2 <= 2*n2^2*x.*y );
	
	elseif strcmp(Name,'Mondrian'),
		if nargin < 3,
			par = 10;
		end
		img = ( x ~= x );
		rand('seed',sum(100*clock))
		for i=1:par,
			xp = ceil(n2*rand(1)) - n2;
			yp = ceil(n2*rand(1)) - n2;
			l = ceil(n2*rand(1));
			h = ceil(n2*rand(1));
			img = img + (x >= xp & x <= xp+l & y >= yp & y <= yp+h);
		end
		
	elseif strcmp(Name,'OvalDiagonal'),
		if nargin < 3,
			par = 2;
		end
		r = ((n-10)/(2*par))^2;
		img = ( (sqrt(2)*x/2 - sqrt(2)*y/2).^2/(par*sqrt(r))^2 + ...
			(sqrt(2)*x/2 + sqrt(2)*y/2).^2/r  <= 1 );
	
	elseif strcmp(Name,'OvalHorizontal'),
		if nargin < 3,
			par = 2;
		end
		r = ((n-10)/(2*par))^2;
		img = ( x.^2/(par*sqrt(r))^2 + y.^2/r  <= 1 );
		
	elseif strcmp(Name,'OvalVertical'),
		if nargin < 3,
			par = 2;
		end
		r = ((n-10)/(2*par))^2;
		img = ( x.^2/r + y.^2/(par*sqrt(r))^2  <= 1 );
		
	elseif strcmp(Name,'StickFigure'),
		p = n/8;
		img = ( x == 0 & y <=  p & y >= -.75*p ) + ...
				( x <= 0 & x >= -p/1.5 & y == x - .75*p ) + ...
			( x >= 0 & x <=  p/1.5 & y == -x - .75*p ) + ...
				( x <= 0 & x >= -p/1.5 & y == -x + p/8 ) + ...
				( x >= 0 & x <=  p/1.5 & y == x + p/8 ) + ...
				( x.^2 + (y - 4*p/3).^2 <= (p/3)^2 );
		img(find(img > 1)) = ones(size(find(img > 1)));
		
	elseif strcmp(Name,'Triangle'),
		img = zeros(n);
		for i=1:n,
			img(i,1:i)=ones(1,i);
		end
		
	elseif strcmp(Name,'VanishingPoint'),
		img = (x ~= x);
		p = n/4;
		c = n/4;
		for j=1:(log(p)/log(2)+1),
			img = img + ( x == c-p & y <= c+p & y >= c-p ) + ...
				 ( x == c+p & y <= c+p & y >= c-p ) + ...
				 ( y == c-p & x <= c+p & x >= c-p ) + ...
		  		( y == c+p & x <= c+p & x >= c-p );
			c = c-p;
			p = p/2;
		end
		img(find(img > 1)) = ones(size(find(img > 1)));
	elseif strcmp(Name,'Square'),
		img = ones(n,n);
		m = n/4;
		pos = (m+1:3*m);
		img(pos,pos) = zeros(2*m,2*m);
		img = 1-img;
	else
    	disp(sprintf('MakeImage: I don''t recognize <<%s>>',Name))
   		disp('Allowable Names are:')
   		disp('Backgammon'),
   		disp('BoxWithCross'),
        disp('Circle'),
        disp('FigureEight'),
		disp('Mondrian'),
		disp('OvalDiagonal'),
		disp('OvalHorizontal'),
		disp('OvalVertical'),
		disp('StickFigure'),
		disp('Triangle'),
		disp('VanishingPoint'),
		disp('Square'),
	end
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
