function q = DownQuad(Quad,qmf,xbit,ybit)
% DownQuad -- Split 2-d image into 4 subbands
%  Usage
%    q = DownQuad(Quad,qmf,xbit,ybit)
%  Inputs
%    Quad   Quadlet to be split into four subbands 
%    qmf    orthogonal quadrature mirror filter  
%    xbit   x-position of quadlet in 2-d freq plane
%    ybit   y-position of quadlet in 2-d freq plane
%  Outputs
%    q      quadlet after splitting
%
%  Description
%    A 2-d signal is split into four subbands: (Lo_x,Lo_y),
%    (Lo_x,Hi_y), (Hi_x,Lo_y), (Hi_x,Hi_y).
%
%    This routine is called by other, higher-level WaveLab functions
%    and may not be useful for many users.
%
%  See Also
%    FPT2_WP, UpQuad
%

	[nr,nc] = size(Quad);
	q    = zeros(nr,nc);
	ybit = rem(ybit,2);
	xbit = rem(xbit,2);
%
	bot = 1:(nc/2);
	top = bot + (nc/2);
%
	for i=1:nr,
		lpchan = DownDyadLo(Quad(i,:),qmf);
		hpchan = DownDyadHi(Quad(i,:),qmf);
%		lpchan = ddc(Quad(i,:),qmf);
%		hpchan = ddd(Quad(i,:),qmf);
		if xbit,
		    q(i,top) = lpchan;
			q(i,bot) = hpchan;
		else
		    q(i,top) = hpchan;
			q(i,bot) = lpchan;
		end
	end
%
	bot = 1:(nr/2);
	top = bot + (nr/2);
%
	for j=1:nc,
		lpchan = DownDyadLo(q(:,j)',qmf)';
		hpchan = DownDyadHi(q(:,j)',qmf)';
%		lpchan = ddc(q(:,j)',qmf)';
%		hpchan = ddd(q(:,j)',qmf)';
		if ybit,
		    q(top,j) = lpchan;
			q(bot,j) = hpchan;
		else
		    q(top,j) = hpchan;
			q(bot,j) = lpchan;
		end
	end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
