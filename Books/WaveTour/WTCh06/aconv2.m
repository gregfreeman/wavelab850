function out = aconv2(img,f1,f2,s1,s2)
% aconv2 -- 2-D seperable convolution
%  Usage
%    out = aconv2(img,f1,f2,s1,s2);
%  Inputs
%    img    m x n image, 
%    f1     column filter
%    f2     row filter
%    s1     column shift, default 0
%    s2     row shift, default 0
%  Output
%    out    convolved image with column filter f1 and row filter f2
%  Examples
%     Test_aconv2.m
%  See Also
%     FWT2_Dyad
% 
if nargin < 5,
	s2 = 0;
end;
if nargin < 4,
	s1 = 0;
end;
f1=f1(:)'; f2=f2(:)'; 
[m, n] = size(img);
out = img;

% column convolution
for col = 1:n,
	out(:,col) = aconv(f1,out(:,col)')';
end;
for times = 1:s1,
	out = DownShift(out);
end;

% row convolution
for row = 1:m,
	out(row,:) = aconv(f2,out(row,:));
end;
for times = 1:s2,
	out = RightShift(out);
end;
%for times = 1:s1,
%	out = DownShift(out);
%end;
%
% Copyright (c) 1996. Xiaoming Huo
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
