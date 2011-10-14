function linim = log2lin(logim,nvoice);
%
% function linim = log2lin(logim,nvoice);
%
% Description : takes a log-scale image l , and transforms it into
%               a linear scale image n
%
% Inputs :	logim : logscale image
%              	nvoice : number of voices (default = 1)
%
% Outputs :	linim : linear scale image
%
% See also : CWT, ImageCWT
%
   if nargin < 2
	nvoice =1;
   end
%
 
   [mn,n] = size(logim);
   m= mn/nvoice;
   s0 = n/(2^m);
   j0 = log2(s0);
    s1 = n;
   max = floor(n/2^(1/nvoice));
% normally, linim has size (max-s0+1,n);
% but this is too big (out of memory for n = 1024)
% so we replace it by (floor((max-s0+1)/10),n);

%   sz = floor((max-s0)/10)+1;
sz = floor((max-s0)/1)+1;
   linim = zeros(sz,n);
    for j = 1:sz,
%        i = (j-1)*10 + s0;
	i = (j-1) + s0;
%   for i = s0:max,
 	li = (log2(i)-j0) * nvoice;
	fli = floor(li);
	rli = li - fli;
	if rli ~= 0,
	    linim(j,:) = rli.*logim(fli+2,:);
        end; % if
	if rli ~= 1,
    	    linim(j,:) =linim(j,:)+(1-rli).*logim(fli+1,:);
	end; % if
   end % i loop 

%
% Written September 25, 1996 by Maureen Clerc
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
