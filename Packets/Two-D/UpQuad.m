function Q = UpQuad(quad,qmf,xbit,ybit)
% UpQuad -- Merge four subbands into 2d image
%  Usage
%    Q = UpQuad(quad,qmf,xbit,ybit)
%  Inputs
%    Quad   quadlet to be joined 4->1 channel 
%    qmf    orthogonal quadrature mirror filter  
%    xbit   x-position of quadlet in 2-d freq plane
%    ybit   y-position of quadlet in 2-d freq plane
%  Outputs
%    q      quadlet after splitting
%
%  Description
%    A 2-d signal split into four channels: (Lo_x,Lo_y),
%    (Lo_x,Hi_y), (Hi_x,Lo_y), (Hi_x,Hi_y) is unsplit
%    into original image.
%
%    This routine is called by other, higher-level WaveLab
%    functions and may not be useful for many users.
%
%  See Also
%    IPT2_WP, DownQuad
%
	[nr,nc] = size(quad);
	Q    = zeros(nr,nc);
	ybit = rem(ybit,2);
	xbit = rem(xbit,2);
%
	bot = 1:(nr/2);
	top = bot + (nr/2);
%
	for j=1:nc,
		if ybit,
		    lpchan = quad(top,j)';
			hpchan = quad(bot,j)';
		else
		    lpchan = quad(bot,j)';
			hpchan = quad(top,j)';
		end

		Q(:,j) = UpDyadLo(lpchan,qmf)' + UpDyadHi(hpchan,qmf)';
	end
%
	bot = 1:(nc/2);
	top = bot + (nc/2);
%
	for i=1:nr,
		if xbit,
		    lpchan = Q(i,top);
			hpchan = Q(i,bot);
		else
		    lpchan = Q(i,bot);
			hpchan = Q(i,top);
		end

		Q(i,:) = UpDyadLo(lpchan,qmf) + UpDyadHi(hpchan,qmf);
	end
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
